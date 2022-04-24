package com.mypack.book.utils;

import lombok.Data;

@Data
public class Result {

    private Integer code;

    private String message;

    private Object data;

}
