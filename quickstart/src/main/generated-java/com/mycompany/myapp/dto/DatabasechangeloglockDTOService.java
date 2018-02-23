/*
 * Project home: https://github.com/jaxio/celerio-angular-quickstart
 * 
 * Source code generated by Celerio, an Open Source code generator by Jaxio.
 * Documentation: http://www.jaxio.com/documentation/celerio/
 * Source code: https://github.com/jaxio/celerio/
 * Follow us on twitter: @jaxiosoft
 * This header can be customized in Celerio conf...
 * Template pack-angular:src/main/java/dto/EntityDTOService.java.e.vm
 */
package com.mycompany.myapp.dto;

import java.util.List;
import java.util.stream.Collectors;

import javax.inject.Inject;

import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mycompany.myapp.domain.Databasechangeloglock;
import com.mycompany.myapp.domain.Databasechangeloglock_;
import com.mycompany.myapp.dto.support.PageRequestByExample;
import com.mycompany.myapp.dto.support.PageResponse;
import com.mycompany.myapp.repository.DatabasechangeloglockRepository;

/**
 * A simple DTO Facility for Databasechangeloglock.
 */
@Service
public class DatabasechangeloglockDTOService {

    @Inject
    private DatabasechangeloglockRepository databasechangeloglockRepository;

    @Transactional(readOnly = true)
    public DatabasechangeloglockDTO findOne(Integer id) {
        return toDTO(databasechangeloglockRepository.findOne(id));
    }

    @Transactional(readOnly = true)
    public List<DatabasechangeloglockDTO> complete(String query, int maxResults) {
        List<Databasechangeloglock> results = databasechangeloglockRepository.complete(query, maxResults);
        return results.stream().map(this::toDTO).collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public PageResponse<DatabasechangeloglockDTO> findAll(PageRequestByExample<DatabasechangeloglockDTO> req) {
        Example<Databasechangeloglock> example = null;
        Databasechangeloglock databasechangeloglock = toEntity(req.example);

        if (databasechangeloglock != null) {
            ExampleMatcher matcher = ExampleMatcher.matching() //
                    .withMatcher(Databasechangeloglock_.lockedby.getName(), match -> match.ignoreCase().startsWith());

            example = Example.of(databasechangeloglock, matcher);
        }

        Page<Databasechangeloglock> page;
        if (example != null) {
            page = databasechangeloglockRepository.findAll(example, req.toPageable());
        } else {
            page = databasechangeloglockRepository.findAll(req.toPageable());
        }

        List<DatabasechangeloglockDTO> content = page.getContent().stream().map(this::toDTO).collect(Collectors.toList());
        return new PageResponse<>(page.getTotalPages(), page.getTotalElements(), content);
    }

    /**
     * Save the passed dto as a new entity or update the corresponding entity if any.
     */
    @Transactional
    public DatabasechangeloglockDTO save(DatabasechangeloglockDTO dto) {
        if (dto == null) {
            return null;
        }

        final Databasechangeloglock databasechangeloglock;

        if (dto.isIdSet()) {
            Databasechangeloglock databasechangeloglockTmp = databasechangeloglockRepository.findOne(dto.id);
            if (databasechangeloglockTmp != null) {
                databasechangeloglock = databasechangeloglockTmp;
            } else {
                databasechangeloglock = new Databasechangeloglock();
                databasechangeloglock.setId(dto.id);
            }
        } else {
            databasechangeloglock = new Databasechangeloglock();
        }

        databasechangeloglock.setLocked(dto.locked);

        databasechangeloglock.setLockgranted(dto.lockgranted);

        databasechangeloglock.setLockedby(dto.lockedby);

        return toDTO(databasechangeloglockRepository.save(databasechangeloglock));
    }

    /**
     * Converts the passed databasechangeloglock to a DTO.
     */
    public DatabasechangeloglockDTO toDTO(Databasechangeloglock databasechangeloglock) {
        return toDTO(databasechangeloglock, 1);
    }

    /**
     * Converts the passed databasechangeloglock to a DTO. The depth is used to control the
     * amount of association you want. It also prevents potential infinite serialization cycles.
     *
     * @param databasechangeloglock
     * @param depth the depth of the serialization. A depth equals to 0, means no x-to-one association will be serialized.
     *              A depth equals to 1 means that xToOne associations will be serialized. 2 means, xToOne associations of
     *              xToOne associations will be serialized, etc.
     */
    public DatabasechangeloglockDTO toDTO(Databasechangeloglock databasechangeloglock, int depth) {
        if (databasechangeloglock == null) {
            return null;
        }

        DatabasechangeloglockDTO dto = new DatabasechangeloglockDTO();

        dto.id = databasechangeloglock.getId();
        dto.locked = databasechangeloglock.getLocked();
        dto.lockgranted = databasechangeloglock.getLockgranted();
        dto.lockedby = databasechangeloglock.getLockedby();
        if (depth-- > 0) {
        }

        return dto;
    }

    /**
     * Converts the passed dto to a Databasechangeloglock.
     * Convenient for query by example.
     */
    public Databasechangeloglock toEntity(DatabasechangeloglockDTO dto) {
        return toEntity(dto, 1);
    }

    /**
     * Converts the passed dto to a Databasechangeloglock.
     * Convenient for query by example.
     */
    public Databasechangeloglock toEntity(DatabasechangeloglockDTO dto, int depth) {
        if (dto == null) {
            return null;
        }

        Databasechangeloglock databasechangeloglock = new Databasechangeloglock();

        databasechangeloglock.setId(dto.id);
        databasechangeloglock.setLocked(dto.locked);
        databasechangeloglock.setLockgranted(dto.lockgranted);
        databasechangeloglock.setLockedby(dto.lockedby);
        if (depth-- > 0) {
        }

        return databasechangeloglock;
    }
}