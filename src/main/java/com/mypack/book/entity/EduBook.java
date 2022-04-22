package com.mypack.book.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

@Data
@TableName(value = "edu_book")
public class EduBook {

    @TableId(value = "id",type = IdType.AUTO)
    private Integer id;
    private String bookNo;
    private String bookName;
    private String author;
    private String library;
    private String floor;
    private Integer address;
    private String categoryName;
    private String publisher;
    private Integer status;
    private String remark;
    private Integer deleteFlag;
    private Date createTime;

}
