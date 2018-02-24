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

@StaticMetamodel(Databasechangelog.class)
public abstract class Databasechangelog_ {

    // Raw attributes
    public static volatile SingularAttribute<Databasechangelog, String> id;
    public static volatile SingularAttribute<Databasechangelog, String> author;
    public static volatile SingularAttribute<Databasechangelog, String> comments;
    public static volatile SingularAttribute<Databasechangelog, String> contexts;
    public static volatile SingularAttribute<Databasechangelog, Instant> dateexecuted;
    public static volatile SingularAttribute<Databasechangelog, String> description;
    public static volatile SingularAttribute<Databasechangelog, String> exectype;
    public static volatile SingularAttribute<Databasechangelog, String> filename;
    public static volatile SingularAttribute<Databasechangelog, String> labels;
    public static volatile SingularAttribute<Databasechangelog, String> liquibase;
    public static volatile SingularAttribute<Databasechangelog, String> md5sum;
    public static volatile SingularAttribute<Databasechangelog, Integer> orderexecuted;
    public static volatile SingularAttribute<Databasechangelog, String> tag;
}