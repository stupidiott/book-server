package com.mypack.book.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.mypack.book.dto.book.BookDTO;
import com.mypack.book.dto.book.BookSearchDTO;
import com.mypack.book.entity.EduBook;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookMapper extends BaseMapper<EduBook> {

    List<BookDTO> list(BookSearchDTO searchDTO);

    Integer countNumByBookNo(String bookNo);

    void updateStatusByBookNo(@Param("bookNo") String bookNo,@Param("status") Integer status);

    void insertCopy(String bookId, String bookNo, int flag);

    List<String> listAvailableCopy(String bookNo);

    void borrowCopy(String bookId, String username);

    void returnCopy(String bookNo, String username);
}
