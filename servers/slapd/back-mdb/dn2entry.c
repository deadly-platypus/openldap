/* dn2entry.c - routines to deal with the dn2id / id2entry glue */
/* $OpenLDAP$ */
/* This work is part of OpenLDAP Software <http://www.openldap.org/>.
 *
 * Copyright 2000-2017 The OpenLDAP Foundation.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted only as authorized by the OpenLDAP
 * Public License.
 *
 * A copy of this license is available in the file LICENSE in the
 * top-level directory of the distribution or, alternatively, at
 * <http://www.OpenLDAP.org/license.html>.
 */

#include "portable.h"

#include <stdio.h>
#include <ac/string.h>

#include "back-mdb.h"

sgx_private void *private_malloc(unsigned long long);

void privatize_passwds(Entry **e) {
    int i;
    printf("making passwords private...");
    Attribute *attr = attr_find((*e)->e_attrs, slap_schema.si_ad_userPassword);    
    if(attr) {
        printf("pp 1\n");
        for(i = 0; attr->a_vals[i].bv_val != NULL; i++)
            ;
        attr->passwds = (BerValue_priv*) 
                malloc(sizeof(BerValue_priv) * i); 
        printf("pp 2\n");
        for(i = 0; attr->a_vals[i].bv_val != NULL; i++) {
        printf("pp 3\n");
            unsigned long long len = attr->a_vals[i].bv_len;
            attr->passwds[i].bv_len = len;
            attr->passwds[i].bv_val = private_malloc(len);
            printf("passwds = %p\n", &attr->passwds[i]);
            printf("passwds[%d].bv_val = %p\n", i, attr->passwds[i].bv_val);
            for(unsigned long long j = 0; j < len; j++) {
        printf("pp 4 - %c\n", attr->a_vals[i].bv_val[j]);
                attr->passwds[i].bv_val[j] = attr->a_vals[i].bv_val[j];
                //attr->a_vals[i].bv_val[j] = '\0';
            }
        }
    }
    printf("done\n");
}

/*
 * dn2entry - look up dn in the cache/indexes and return the corresponding
 * entry. If the requested DN is not found and matched is TRUE, return info
 * for the closest ancestor of the DN. Otherwise e is NULL.
 */

int
mdb_dn2entry(
	Operation *op,
	MDB_txn *tid,
	MDB_cursor *m2,
	struct berval *dn,
	Entry **e,
	ID *nsubs,
	int matched )
{
	struct mdb_info *mdb = (struct mdb_info *) op->o_bd->be_private;
	int rc, rc2;
	ID id = NOID;
	struct berval mbv, nmbv;
	MDB_cursor *mc;

	Debug(LDAP_DEBUG_TRACE, "mdb_dn2entry(\"%s\")\n",
		dn->bv_val ? dn->bv_val : "", 0, 0 );

	*e = NULL;

    printf("1\n ");
	rc = mdb_dn2id( op, tid, m2, dn, &id, nsubs, &mbv, &nmbv );
    printf("2\n ");
	if ( rc ) {
    printf("3\n ");
		if ( matched ) {
    printf("4\n ");
			rc2 = mdb_cursor_open( tid, mdb->mi_id2entry, &mc );
			if ( rc2 == MDB_SUCCESS ) {
    printf("5\n ");
				rc2 = mdb_id2entry( op, mc, id, e );
				mdb_cursor_close( mc );
			}
		}

	} else {
    printf("6\n ");
		rc = mdb_cursor_open( tid, mdb->mi_id2entry, &mc );
		if ( rc == MDB_SUCCESS ) {
    printf("7\n ");
			rc = mdb_id2entry( op, mc, id, e );
			mdb_cursor_close(mc);
		}
	}
	if ( *e ) {
    printf("8\n ");
		(*e)->e_name = mbv;
		if ( rc == MDB_SUCCESS ) {
    printf("9\n ");
			ber_dupbv_x( &(*e)->e_nname, dn, op->o_tmpmemctx );
            privatize_passwds(e);
        } else {
    printf("10\n ");
			ber_dupbv_x( &(*e)->e_nname, &nmbv, op->o_tmpmemctx );
        }
	} else {
    printf("11\n ");
		op->o_tmpfree( mbv.bv_val, op->o_tmpmemctx );
	}

    printf("12\n ");
	return rc;
}
