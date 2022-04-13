package com.mypack.book.utils;


import com.mypack.book.constants.EnumResponse;

public class ResultUtils {

    public static Result success(Object data) {
        Result result = new Result();
        result.setCode(EnumResponse.SUCCESS.getCode());
        result.setMessage(EnumResponse.SUCCESS.getMessage());
        result.setData(data);
        return result;
    }

    public static Result success() {
        Result result = new Result();
        result.setCode(EnumResponse.SUCCESS.getCode());
        result.setMessage(EnumResponse.SUCCESS.getMessage());
        return result;
    }

    public static Result fail(EnumResponse enumStatus) {
        Result result = new Result();
        result.setCode(enumStatus.getCode());
        result.setMessage(enumStatus.getMessage());
        return result;
    }

}
