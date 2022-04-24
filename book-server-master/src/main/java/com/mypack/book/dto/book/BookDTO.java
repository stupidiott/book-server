package com.mypack.book.dto.book;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BookDTO {

    private Integer id;
    private String bookNo;
    private String bookName;
    private String author;
    private String library;
    private String categoryName;
    private String publisher;
    private Integer status;
    private String remark;
    private Integer deleteFlag;
    private Date createTime;
    private String floor;
    private Integer address;

}
