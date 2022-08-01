package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.BoardDTO;

@Mapper("BoardMapper")
public interface IBoardMapper {
	
	List<BoardDTO> getBoardList() throws Exception;

	int insertPost(BoardDTO pDTO) throws Exception;

	BoardDTO getPostDetail(BoardDTO pDTO) throws Exception;
	
	int deletePost(BoardDTO pDTO) throws Exception;

	int updatePost(BoardDTO pDTO) throws Exception;
	
	List<BoardDTO> getBoardList(BoardDTO uDTO) throws Exception;

	List<BoardDTO> getsearchList(BoardDTO bDTO) throws Exception;

}
