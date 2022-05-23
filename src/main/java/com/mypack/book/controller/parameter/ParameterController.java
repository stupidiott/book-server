package com.mypack.book.controller.parameter;

import com.github.pagehelper.PageInfo;
import com.mypack.book.constants.EnumResponse;
import com.mypack.book.dto.book.BookDTO;
import com.mypack.book.dto.parameter.ParameterDTO;
import com.mypack.book.exception.BookNoExistException;
import com.mypack.book.service.parameter.ParameterService;
import com.mypack.book.utils.Result;
import com.mypack.book.utils.ResultUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/parameter")
public class ParameterController {


    @Autowired
    private ParameterService parameterService;

    @RequestMapping("/list")
    public Result list(String parameterType) {

        if(StringUtils.isEmpty(parameterType)){
            return ResultUtils.fail(EnumResponse.INVALID_PARAM);
        }

        List<ParameterDTO> parameterDTOList = parameterService.list(parameterType);

        return ResultUtils.success(new PageInfo<>(parameterDTOList));


    }

    @RequestMapping("/add")
    public Result add(@RequestBody ParameterDTO parameterDTO) {

        parameterDTO.setId(null);

        try {
            parameterService.insert(parameterDTO);
        } catch (BookNoExistException e) {
            e.printStackTrace();
        }

        return ResultUtils.success();

    }

}
