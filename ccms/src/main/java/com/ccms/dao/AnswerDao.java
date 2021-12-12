package com.ccms.dao;

import com.ccms.pojo.Notice;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface AnswerDao {
    // 查询
    @Select("select DISTINCT n.id,n.userId,n.title,n.content,n.operatetime,"
            + "n.type,aw.flag,su.name as noticebelong,(case type when 1 then '消息' "
            + "when 2 then '投票' when 3 then '报修' when 4 then '通知' end) as typeName " + "from notice as n "
            + "left join sys_user as su on n.userId=su.userCode " + "left join answer as aw on n.id = aw.nid "
            + "where n.id in (select nid from answer where uid=#{uid}) and uid=#{uid} " + " order by operatetime desc")
    List<Notice> getAllNotice(@Param("uid") String uid);

    // 更改通知标记
    @Update("update answer set flag=1,vote=#{vote} where nid = #{nid} and uid =#{uid}")
    int upFalg(@Param("vote") String vote, @Param("nid") String nid, @Param("uid") String uid);
}
