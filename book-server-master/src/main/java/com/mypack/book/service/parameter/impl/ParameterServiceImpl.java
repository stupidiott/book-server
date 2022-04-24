package com.mypack.book.service.parameter.impl;

import cn.hutool.core.util.StrUtil;
import com.mypack.book.dto.parameter.ParameterDTO;
import com.mypack.book.mapper.ParameterMapper;
import com.mypack.book.service.parameter.ParameterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ParameterServiceImpl implements ParameterService {

    @Autowired
    private ParameterMapper parameterMapper;

    @Override
    public List<ParameterDTO> list(String parameterType) {

        if (StrUtil.isEmpty(parameterType)) {
            return null;
        }

        return parameterMapper.list(parameterType);
    }
}
