package com.nrifintech.bms.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.nrifintech.bms.entity.Route;

@Repository
public interface RouteRepository extends AbstractBaseRepository<Route, Integer> {

	@Query("SELECT DISTINCT r.startName FROM Route r")
	List<String> findDistinctRouteStartName();

	@Query("SELECT DISTINCT r.stopName FROM Route r")
	List<String> findDistinctRouteStopName();

	List<Route> findAll();

}
