package com.mypack.book.dto;

import lombok.Data;

@Data
public class PageForm {

    private int pageNum = 1;

    private int pageSize = 10;

}
