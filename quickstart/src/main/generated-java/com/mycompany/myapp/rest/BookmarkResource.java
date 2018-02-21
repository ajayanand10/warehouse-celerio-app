/*
 * Project home: https://github.com/jaxio/celerio-angular-quickstart
 * 
 * Source code generated by Celerio, an Open Source code generator by Jaxio.
 * Documentation: http://www.jaxio.com/documentation/celerio/
 * Source code: https://github.com/jaxio/celerio/
 * Follow us on twitter: @jaxiosoft
 * This header can be customized in Celerio conf...
 * Template pack-angular:src/main/java/rest/EntityResource.java.e.vm
 */
package com.mycompany.myapp.rest;

import static org.springframework.http.MediaType.APPLICATION_JSON_VALUE;
import static org.springframework.web.bind.annotation.RequestMethod.DELETE;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;
import static org.springframework.web.bind.annotation.RequestMethod.PUT;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.Optional;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RequestBody;

import com.mycompany.myapp.domain.Bookmark;
import com.mycompany.myapp.dto.BookmarkDTO;
import com.mycompany.myapp.dto.BookmarkDTOService;
import com.mycompany.myapp.dto.support.PageRequestByExample;
import com.mycompany.myapp.dto.support.PageResponse;
import com.mycompany.myapp.repository.BookmarkRepository;
import com.mycompany.myapp.rest.support.AutoCompleteQuery;

@RestController
@RequestMapping("/api/bookmarks")
public class BookmarkResource {

    private final Logger log = LoggerFactory.getLogger(BookmarkResource.class);

    @Inject
    private BookmarkRepository bookmarkRepository;
    @Inject
    private BookmarkDTOService bookmarkDTOService;

    /**
     * Create a new Bookmark.
     */
    @RequestMapping(value = "/", method = POST, produces = APPLICATION_JSON_VALUE)
    public ResponseEntity<BookmarkDTO> create(@RequestBody BookmarkDTO bookmarkDTO) throws URISyntaxException {

        log.debug("Create BookmarkDTO : {}", bookmarkDTO);

        if (bookmarkDTO.isIdSet()) {
            return ResponseEntity.badRequest().header("Failure", "Cannot create Bookmark with existing ID").body(null);
        }

        BookmarkDTO result = bookmarkDTOService.save(bookmarkDTO);

        return ResponseEntity.created(new URI("/api/bookmarks/" + result.id)).body(result);
    }

    /**
    * Find by id Bookmark.
    */
    @RequestMapping(value = "/{id}", method = GET, produces = APPLICATION_JSON_VALUE)
    public ResponseEntity<BookmarkDTO> findById(@PathVariable Integer id) throws URISyntaxException {

        log.debug("Find by id Bookmark : {}", id);

        return Optional.ofNullable(bookmarkDTOService.findOne(id)).map(bookmarkDTO -> new ResponseEntity<>(bookmarkDTO, HttpStatus.OK))
                .orElse(new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    /**
     * Update Bookmark.
     */
    @RequestMapping(value = "/", method = PUT, produces = APPLICATION_JSON_VALUE)
    public ResponseEntity<BookmarkDTO> update(@RequestBody BookmarkDTO bookmarkDTO) throws URISyntaxException {

        log.debug("Update BookmarkDTO : {}", bookmarkDTO);

        if (!bookmarkDTO.isIdSet()) {
            return create(bookmarkDTO);
        }

        BookmarkDTO result = bookmarkDTOService.save(bookmarkDTO);

        return ResponseEntity.ok().body(result);
    }

    /**
     * Find a Page of Bookmark using query by example.
     */
    @RequestMapping(value = "/page", method = POST, produces = APPLICATION_JSON_VALUE)
    public ResponseEntity<PageResponse<BookmarkDTO>> findAll(@RequestBody PageRequestByExample<BookmarkDTO> prbe) throws URISyntaxException {
        PageResponse<BookmarkDTO> pageResponse = bookmarkDTOService.findAll(prbe);
        return new ResponseEntity<>(pageResponse, new HttpHeaders(), HttpStatus.OK);
    }

    /**
    * Auto complete support.
    */
    @RequestMapping(value = "/complete", method = POST, produces = APPLICATION_JSON_VALUE)
    public ResponseEntity<List<BookmarkDTO>> complete(@RequestBody AutoCompleteQuery acq) throws URISyntaxException {

        List<BookmarkDTO> results = bookmarkDTOService.complete(acq.query, acq.maxResults);

        return new ResponseEntity<>(results, new HttpHeaders(), HttpStatus.OK);
    }

    /**
     * Delete by id Bookmark.
     */
    @RequestMapping(value = "/{id}", method = DELETE, produces = APPLICATION_JSON_VALUE)
    public ResponseEntity<Void> delete(@PathVariable Integer id) throws URISyntaxException {

        log.debug("Delete by id Bookmark : {}", id);

        try {
            bookmarkRepository.delete(id);
            return ResponseEntity.ok().build();
        } catch (Exception x) {
            // todo: dig exception, most likely org.hibernate.exception.ConstraintViolationException
            return ResponseEntity.status(HttpStatus.CONFLICT).build();
        }
    }
}