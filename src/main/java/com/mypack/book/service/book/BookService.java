package com.mypack.book.service.book;

import com.mypack.book.dto.book.BookDTO;
import com.mypack.book.dto.book.BookSearchDTO;
import com.mypack.book.exception.BookNoExistException;

import java.util.List;

public interface BookService {

    List<BookDTO> list(BookSearchDTO searchDTO, boolean isPage);

    void insert(BookDTO bookDTO) throws BookNoExistException;

    void update(BookDTO bookDTO);

    void updateStatusByBookNo(String bookNo, Integer status);

    void insertCopy(BookDTO bookDTO);

    void returnCopy(String bookNo, String username);
}
