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

import com.mycompany.myapp.domain.Goods;
import com.mycompany.myapp.domain.Goods_;
import com.mycompany.myapp.dto.support.PageRequestByExample;
import com.mycompany.myapp.dto.support.PageResponse;
import com.mycompany.myapp.repository.GoodsRepository;

/**
 * A simple DTO Facility for Goods.
 */
@Service
public class GoodsDTOService {

    @Inject
    private GoodsRepository goodsRepository;

    @Transactional(readOnly = true)
    public GoodsDTO findOne(Integer id) {
        return toDTO(goodsRepository.findOne(id));
    }

    @Transactional(readOnly = true)
    public List<GoodsDTO> complete(String query, int maxResults) {
        List<Goods> results = goodsRepository.complete(query, maxResults);
        return results.stream().map(this::toDTO).collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public PageResponse<GoodsDTO> findAll(PageRequestByExample<GoodsDTO> req) {
        Example<Goods> example = null;
        Goods goods = toEntity(req.example);

        if (goods != null) {
            ExampleMatcher matcher = ExampleMatcher.matching() //
                    .withMatcher(Goods_.name.getName(), match -> match.ignoreCase().startsWith())
                    .withMatcher(Goods_.description.getName(), match -> match.ignoreCase().startsWith());

            example = Example.of(goods, matcher);
        }

        Page<Goods> page;
        if (example != null) {
            page = goodsRepository.findAll(example, req.toPageable());
        } else {
            page = goodsRepository.findAll(req.toPageable());
        }

        List<GoodsDTO> content = page.getContent().stream().map(this::toDTO).collect(Collectors.toList());
        return new PageResponse<>(page.getTotalPages(), page.getTotalElements(), content);
    }

    /**
     * Save the passed dto as a new entity or update the corresponding entity if any.
     */
    @Transactional
    public GoodsDTO save(GoodsDTO dto) {
        if (dto == null) {
            return null;
        }

        final Goods goods;

        if (dto.isIdSet()) {
            Goods goodsTmp = goodsRepository.findOne(dto.id);
            if (goodsTmp != null) {
                goods = goodsTmp;
            } else {
                goods = new Goods();
                goods.setId(dto.id);
            }
        } else {
            goods = new Goods();
        }

        goods.setName(dto.name);

        goods.setDescription(dto.description);

        goods.setCreationDate(dto.creationDate);

        goods.setCreationAuthor(dto.creationAuthor);

        goods.setLastModificationDate(dto.lastModificationDate);

        goods.setLastModificationAuthor(dto.lastModificationAuthor);

        goods.setVersion(dto.version);

        return toDTO(goodsRepository.save(goods));
    }

    /**
     * Converts the passed goods to a DTO.
     */
    public GoodsDTO toDTO(Goods goods) {
        return toDTO(goods, 1);
    }

    /**
     * Converts the passed goods to a DTO. The depth is used to control the
     * amount of association you want. It also prevents potential infinite serialization cycles.
     *
     * @param goods
     * @param depth the depth of the serialization. A depth equals to 0, means no x-to-one association will be serialized.
     *              A depth equals to 1 means that xToOne associations will be serialized. 2 means, xToOne associations of
     *              xToOne associations will be serialized, etc.
     */
    public GoodsDTO toDTO(Goods goods, int depth) {
        if (goods == null) {
            return null;
        }

        GoodsDTO dto = new GoodsDTO();

        dto.id = goods.getId();
        dto.name = goods.getName();
        dto.description = goods.getDescription();
        dto.creationDate = goods.getCreationDate();
        dto.creationAuthor = goods.getCreationAuthor();
        dto.lastModificationDate = goods.getLastModificationDate();
        dto.lastModificationAuthor = goods.getLastModificationAuthor();
        dto.version = goods.getVersion();
        if (depth-- > 0) {
        }

        return dto;
    }

    /**
     * Converts the passed dto to a Goods.
     * Convenient for query by example.
     */
    public Goods toEntity(GoodsDTO dto) {
        return toEntity(dto, 1);
    }

    /**
     * Converts the passed dto to a Goods.
     * Convenient for query by example.
     */
    public Goods toEntity(GoodsDTO dto, int depth) {
        if (dto == null) {
            return null;
        }

        Goods goods = new Goods();

        goods.setId(dto.id);
        goods.setName(dto.name);
        goods.setDescription(dto.description);
        goods.setCreationDate(dto.creationDate);
        goods.setCreationAuthor(dto.creationAuthor);
        goods.setLastModificationDate(dto.lastModificationDate);
        goods.setLastModificationAuthor(dto.lastModificationAuthor);
        goods.setVersion(dto.version);
        if (depth-- > 0) {
        }

        return goods;
    }
}