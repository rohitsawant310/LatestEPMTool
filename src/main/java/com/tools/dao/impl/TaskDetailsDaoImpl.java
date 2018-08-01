package com.tools.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tools.beans.Tasks;
import com.tools.beans.UserDetails;
import com.tools.dao.TaskDetailsDao;
import com.tools.mapper.TaskDetailsRowMapper;
import com.tools.mapper.UserDetailsRowMapper;

@Service
public class TaskDetailsDaoImpl implements TaskDetailsDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Transactional
	@Override
	public int addNewTask(Tasks task) {

		SimpleJdbcInsert simpleJdbcInsert = new SimpleJdbcInsert(jdbcTemplate);
		simpleJdbcInsert.withTableName("TASKS").usingGeneratedKeyColumns("id");

		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("TASKNAME", task.getTaskName());
		parameters.put("TASKTYPE", task.getTaskType());
		parameters.put("TASKDESC", task.getTaskDescription());
		parameters.put("TASK_CREATEDATE", new Date());
		parameters.put("TASK_UPDATEDATE", new Date());
		parameters.put("TASK_CLOSEDDATE",  task.getTaskClosedDate());
		parameters.put("TASK_COMMITDATE",  task.getTaskCommitDate());
		parameters.put("TASK_STARTDATE",  task.getTaskStartDate());
		parameters.put("TASK_STATUS",  task.getTaskStatus());
		parameters.put("CREATORID",  task.getCreaterId());
		parameters.put("OWNER_USERID",task.getOwnerUserId());
		parameters.put("OWNER_GROUPID", task.getOwnerGroupId());
		parameters.put("POINTS", task.getPoints());
		parameters.put("ENABLED", "Y");
		
		Number insertedId = simpleJdbcInsert.executeAndReturnKey(parameters);
		return insertedId.intValue();
	}

	@Override
	public List<Tasks> getAllTasks(String userId,String userGroup,String userDesignation) {
		System.out.println("Data***"+userId+"-"+userGroup+"-"+userDesignation);
		List<Tasks> taskDetails=null;
		if("ADMIN".equalsIgnoreCase(userDesignation)) {
			taskDetails =(List<Tasks>) jdbcTemplate.query("SELECT * FROM TASKS", new TaskDetailsRowMapper());
		}else {
			taskDetails =(List<Tasks>) jdbcTemplate.query("SELECT * FROM TASKS where OWNER_USERID=? ",new Object[] {userId}, new TaskDetailsRowMapper());
		}
		
		System.out.println(taskDetails);
		
		return taskDetails;
	}

	@Override
	public Tasks getTaskByName(String taskName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Tasks getTaskById(Integer taskId) {
		
		Tasks task=(Tasks)jdbcTemplate.queryForObject("SELECT * FROM TASKS where id= ? ",new Object[] {taskId}, new TaskDetailsRowMapper());
		return task;
	}
	
	@Override
	public Map<String,Integer> getTaskStats(){
		
		Map<String,Integer> taskStats=jdbcTemplate.query("select TASK_STATUS,count(1) count from TASKS group by TASK_STATUS UNION ALL select 'Total' TASK_STATUS,count(1) count from TASKS", new ResultSetExtractor<Map>(){
		    @Override
		    public Map extractData(ResultSet rs) throws SQLException,DataAccessException {
		        HashMap<String,Integer> mapRet= new HashMap<String,Integer>();
		        while(rs.next()){
		            mapRet.put(rs.getString("TASK_STATUS"),rs.getInt("COUNT"));
		        }
		        return mapRet;
		    }
		});
	System.out.println("taskStats"+taskStats);
	return taskStats;
	}
	
	@Override
	public Map<String,Integer> getTotalTasksDayWise(){
		
		Map<String,Integer> taskStats=jdbcTemplate.query("select date(TASK_CREATEDATE) DAY,count(1) COUNT from TASKS group by date(TASK_CREATEDATE) order by date(TASK_CREATEDATE) desc", new ResultSetExtractor<Map>(){
		    @Override
		    public Map extractData(ResultSet rs) throws SQLException,DataAccessException {
		        HashMap<String,Integer> mapRet= new HashMap<String,Integer>();
		        while(rs.next()){
		            mapRet.put(rs.getString("DAY"),rs.getInt("COUNT"));
		        }
		        return mapRet;
		    }
		});
	return taskStats;
	}

	@Override
	public Map<String, Integer> getTaskWiseTotalWork() {
		Map<String,Integer> taskStats=jdbcTemplate.query("select TASKTYPE,count(1) COUNT from TASKS group by TASKTYPE", new ResultSetExtractor<Map<String,Integer>>(){
		    @Override
		    public Map extractData(ResultSet rs) throws SQLException,DataAccessException {
		        HashMap<String,Integer> mapRet= new HashMap<String,Integer>();
		        while(rs.next()){
		            mapRet.put(rs.getString("TASKTYPE"),rs.getInt("COUNT"));
		        }
		        return mapRet;
		    }
		});
	return taskStats;
	}

	@Override
	public int updateTaskData(Tasks taskData) {

		String sql = "UPDATE TASKS SET TASKNAME=? ,TASKTYPE=?,TASKDESC=?,TASK_UPDATEDATE=?,TASK_CLOSEDDATE=?,TASK_COMMITDATE=?,"
				+ " TASK_STATUS = ?, OWNER_USERID= ? , POINTS= ? WHERE ID = ?";
		int resp = jdbcTemplate.update(sql,
				new Object[] { taskData.getTaskName(),taskData.getTaskType(),taskData.getTaskDescription(),new Date(),taskData.getTaskClosedDate(),taskData.getTaskCommitDate(),taskData.getTaskStatus(),taskData.getOwnerUserId(),taskData.getPoints(),taskData.getId()});
	
		return resp;
	}

	@Override
	public List<Tasks> getTopFiveTasksByPoints() {		
		return (List<Tasks>) jdbcTemplate.query("SELECT * from TASKS where POINTS is not null order by POINTS desc LIMIT 5", new TaskDetailsRowMapper());
	}

}
