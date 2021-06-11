package com.mobileshop.mapper;

import java.util.List;
import java.util.Map;

import com.mobileshop.model.BookModel;
import com.mobileshop.model.BookTableModel;

public interface BookMapper {
	public List<BookModel> getAll() throws Exception;
	public List<BookTableModel> getAllBookTable() throws Exception;
	public BookModel getBook(Map<String, Object> params);
	public void saveBookByOrder(BookModel bookModel) throws Exception;
	public void updateOne(BookModel bookModel)throws Exception;
	public void saveOne(BookModel bookModel)throws Exception;
	public void deleteOne(Map<String, Object> params);
	public List<BookTableModel> searchBookTable(String condition) throws Exception;
	public List<BookModel> getByUserId(String userId) throws Exception;
	
}
