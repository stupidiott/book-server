package com.mypack.book.service.parameter.impl;

import cn.hutool.core.util.StrUtil;
import com.mypack.book.constants.EnumResponse;
import com.mypack.book.dto.book.BookDTO;
import com.mypack.book.dto.parameter.ParameterDTO;
import com.mypack.book.entity.EduBook;
import com.mypack.book.entity.EduParameter;
import com.mypack.book.exception.BookNoExistException;
import com.mypack.book.mapper.ParameterMapper;
import com.mypack.book.service.parameter.ParameterService;
import ma.glasnost.orika.MapperFacade;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class ParameterServiceImpl implements ParameterService {

    @Autowired
    private ParameterMapper parameterMapper;

    @Autowired
    private MapperFacade mapperFacade;

    @Override
    public List<ParameterDTO> list(String parameterType) {

        if (StrUtil.isEmpty(parameterType)) {
            return null;
        }

        return parameterMapper.list(parameterType);
    }

    @Override
    public void insert(ParameterDTO parameterDTO) {

        parameterDTO.setCreateTime(new Date());

        EduParameter parameter = mapperFacade.map(parameterDTO,EduParameter.class);

        parameterMapper.insert(parameter);
    }
}
