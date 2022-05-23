package com.mypack.book.service.parameter;

import com.mypack.book.dto.parameter.ParameterDTO;
import com.mypack.book.exception.BookNoExistException;

import java.util.List;

public interface ParameterService {

    List<ParameterDTO> list(String parameterType);

    void insert(ParameterDTO parameterDTO) throws BookNoExistException;
}
