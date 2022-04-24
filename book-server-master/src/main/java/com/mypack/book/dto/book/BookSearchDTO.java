package com.mypack.book.dto.book;

import com.mypack.book.dto.PageForm;
import lombok.Data;

@Data
public class BookSearchDTO extends PageForm {

    private String bookName;
    private Integer status;

}
