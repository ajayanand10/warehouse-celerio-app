/*
 * Project home: https://github.com/jaxio/celerio-angular-quickstart
 * 
 * Source code generated by Celerio, an Open Source code generator by Jaxio.
 * Documentation: http://www.jaxio.com/documentation/celerio/
 * Source code: https://github.com/jaxio/celerio/
 * Follow us on twitter: @jaxiosoft
 * This header can be customized in Celerio conf...
 * Template pack-angular:src/main/java/domain/EntityMeta_.java.e.vm
 */
package com.mycompany.myapp.domain;

import java.time.Instant;

import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@StaticMetamodel(Databasechangeloglock.class)
public abstract class Databasechangeloglock_ {

    // Raw attributes
    public static volatile SingularAttribute<Databasechangeloglock, Integer> id;
    public static volatile SingularAttribute<Databasechangeloglock, Boolean> locked;
    public static volatile SingularAttribute<Databasechangeloglock, Instant> lockgranted;
    public static volatile SingularAttribute<Databasechangeloglock, String> lockedby;
}