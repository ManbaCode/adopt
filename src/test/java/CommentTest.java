import com.ecjtu.entity.Comment;
import com.ecjtu.entity.Users;
import com.ecjtu.mapper.CommentMapper;
import org.apache.ibatis.type.JdbcType;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;
import java.util.List;

/**
 * @author Mr Wu
 * @create: 2019-08-21 19:26
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "classpath:Spring-dao.xml" })
public class CommentTest {

    @Autowired
    private CommentMapper commentMapper;

    @Test
    public void select(){
        List<Comment> comments = commentMapper.getComments();
        for(Comment c: comments){
            System.out.println(c);
        }
    }

    @Test
    public void select1(){
        Comment comment=new Comment();
        Users users=new Users();
        users.setId(3);
        comment.setUser(users);
        comment.setId(3);
        Comment byId = commentMapper.findById(3);
        System.out.println(byId);
    }

    @Test
    public void insert(){
        int i = commentMapper.addComment(new Comment(new Date(), "111"));
        System.out.println(i);
    }
    @Test
    public void selectName(){
       Comment comment1= commentMapper.findById(3);
        System.out.println(comment1);

    }
}
