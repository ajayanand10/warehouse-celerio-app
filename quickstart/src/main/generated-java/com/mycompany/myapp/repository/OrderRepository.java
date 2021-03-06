/*
 * Project home: https://github.com/jaxio/celerio-angular-quickstart
 * 
 * Source code generated by Celerio, an Open Source code generator by Jaxio.
 * Documentation: http://www.jaxio.com/documentation/celerio/
 * Source code: https://github.com/jaxio/celerio/
 * Follow us on twitter: @jaxiosoft
 * This header can be customized in Celerio conf...
 * Template pack-angular:src/main/java/repository/EntityRepository.java.e.vm
 */
package com.mycompany.myapp.repository;

import java.util.List;

import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.repository.*;

import com.mycompany.myapp.domain.Order;
import com.mycompany.myapp.domain.Order_;

public interface OrderRepository extends JpaRepository<Order, Integer> {

    default List<Order> complete(String query, int maxResults) {
        Order probe = new Order();
        probe.setCreationAuthor(query);

        ExampleMatcher matcher = ExampleMatcher.matching() //
                .withMatcher(Order_.creationAuthor.getName(), match -> match.ignoreCase().startsWith());

        Page<Order> page = findAll(Example.of(probe, matcher), new PageRequest(0, maxResults));
        return page.getContent();
    }
}