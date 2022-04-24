package com.mypack.book.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.mypack.book.dto.parameter.ParameterDTO;
import com.mypack.book.entity.EduParameter;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ParameterMapper extends BaseMapper<EduParameter> {

    List<ParameterDTO> list(@Param("parameterType") String parameterType);

}
