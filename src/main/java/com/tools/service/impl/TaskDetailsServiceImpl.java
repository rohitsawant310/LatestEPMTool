package com.tools.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.tools.beans.Tasks;
import com.tools.dao.TaskDetailsDao;
import com.tools.service.ProjectUtiliyService;
import com.tools.service.TaskDetailsService;

@Service
public class TaskDetailsServiceImpl implements TaskDetailsService {

	@Autowired
	private TaskDetailsDao taskDetailsDao;
	
	@Autowired
	private ProjectUtiliyService projectUtility;
	
	@Override
	public int addNewTask(Tasks task) {

		Integer points=projectUtility.calculatePointsForTask(task);
		task.setPoints(points);
		return taskDetailsDao.addNewTask(task);
	}

	@Override
	public List<Tasks> getAllTasks(String userId,String userGroup,String userDesignation) {
		return taskDetailsDao.getAllTasks(userId,userGroup,userDesignation);
	}

	@Override
	public Tasks getTaskByName(String taskName) {
		return taskDetailsDao.getTaskByName(taskName);
	}

	@Override
	public Tasks getTaskById(Integer taskId) {
		return taskDetailsDao.getTaskById(taskId);
	}

	@Override
	public Map<String, Integer> getTaskStats() {
		return taskDetailsDao.getTaskStats();
	}

	@Override
	public Map<String, Integer> getTotalTasksDayWise() {
		return taskDetailsDao.getTotalTasksDayWise();
	}

	@Override
	public Map<String, Integer> getTaskWiseTotalWork() {
		return taskDetailsDao.getTaskWiseTotalWork();
	}

	@Override
	public int updateTaskData(Tasks taskData) {
		Integer points=projectUtility.calculatePointsForTask(taskData);
		taskData.setPoints(points);
		
		return taskDetailsDao.updateTaskData(taskData);
	}
	@Override
	public List<Tasks> getTopFiveTasksByPoints() {
		return taskDetailsDao.getTopFiveTasksByPoints();
	}
}
