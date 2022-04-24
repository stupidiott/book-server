package com.mypack.book.service.parameter;

import com.mypack.book.dto.parameter.ParameterDTO;

import java.util.List;

public interface ParameterService {

    List<ParameterDTO> list(String parameterType);

}
