package com.ccms.dao;

import com.ccms.dao.provider.NoticeDynaSqlProvider;
import com.ccms.pojo.Echarts;
import com.ccms.pojo.Notice;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

public interface NoticeDao {
    // 分页查询通知
    @SelectProvider(type = NoticeDynaSqlProvider.class, method = "selectWithParam")
    public List<Notice> selectByPage(Map<String, Object> params);

    // 根据条件查询通知总数
    @SelectProvider(type = NoticeDynaSqlProvider.class, method = "count")
    Integer count(Map<String, Object> params);

    // 根据id获取通知
    @Select("select n.id,n.userId,n.title,n.content,n.operatetime,n.type,su.name as noticebelong,"
            + "(case type when 1 then '消息' when 2 then '投票' when 3 then '报修' "
            + "when 4 then '通知' end) as typeName from notice as n "
            + "left join sys_user as su on n.userId=su.userCode where n.id = #{id} ")
    public List<Notice> getNoticeById(@Param("id") String id);

    // 添加通知
    @Insert("insert into notice values(#{id},#{userId},#{title},#{content},#{operatetime},#{type})")
    public int addNotice(Notice notice);

    @Insert("insert into answer(id,nid,uid) values(#{id},#{nid},#{uid})")
    public int addAnswer(@Param("id") String id, @Param("nid") String nid, @Param("uid") String uid);

    // 删除通知
    @Delete("delete from notice where id in (${ids})")
    public int delNotice(@Param("ids") String ids);

    // 删除通知关联的Answer
    @Delete("delete from answer where nid in (${ids})")
    public int delAnswer(@Param("ids") String ids);

    // 获取已读未读消息数目
    @Select("select count(*) as value ,(case flag when 0 then '未查收' when 1 then '已查收' end) as name "
            + "from answer where nid = #{nid} group by flag")
    public List<Echarts> getNoticeReadNum(@Param("nid") String nid);

    // 获取投票信息
    @Select("select count(*) as value ,(case vote when 1 then '赞成' when 2 then '反对' end) as name "
            + "from answer where nid = (select id from notice where type = '2' and id=#{id}) "
            + "and (vote=1 or vote =2) group by vote")
    public List<Echarts> getNoticeVoteNum(@Param("id") String id);

}
