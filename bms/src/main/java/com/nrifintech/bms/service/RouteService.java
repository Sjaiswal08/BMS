package com.nrifintech.bms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.nrifintech.bms.entity.Route;
import com.nrifintech.bms.repository.RouteRepository;

@Service
public class RouteService {

	@Autowired
	private RouteRepository repository;

	@Cacheable("sources")
	public List<String> getDistinctRouteStartName() {
		return repository.findDistinctRouteStartName();
	}

	@Cacheable("destinations")
	public List<String> getDistinctRouteStopName() {
		return repository.findDistinctRouteStopName();
	}

	public Route getById(int id) {
		return repository.getById(id);
	}

	public long countRoutes() {
		return repository.count();
	}

	public List<Route> findAll() {
		return repository.findAll();
	}

}
