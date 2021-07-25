use Animal_Rescue_Center;

-- --------------------Some example for queries-------------------------
-- ------------------------Rescued_animal---------------------------
# Number of animal of each kind
select K.ani_kind, count(R.ani_ID) as num_of_ani
from kinds_animal as K left join rescued_animal as R on K.ani_ID = R.ani_ID
group by K.ani_ID order by count(R.ani_ID) desc;

#Number of released animal of each kind
select K.ani_kind, count(Rl.ani_ID) as num
from Kinds_animal as K
    left join released_animal as Rl on Rl.ani_ID = k.ani_ID
group by K.ani_ID;
  
# Date of health checking
select * from health_status
where check_date = '2021-2-4';
--
select * from health_status
where check_date = (select min(check_date) from health_status);

# Information about releaed animal
select * from rescued_animal
where (ani_ID, res_ID) in (select ani_ID, res_ID from released_animal);
--
select * from rescued_animal
where (ani_ID, res_ID) in (select ani_ID, res_ID from adopted_history);
--
select * from rescued_animal
where ((ani_ID, res_ID) not in (select ani_ID, res_ID from adopted_history)) 
		and ((ani_ID, res_ID) not in (select ani_ID, res_ID from released_animal));

# Adopters who adopted the dog
select * from  adopters as A join adopted_history as Ah on A.adt_ID = Ah.adt_ID
	where Ah.ani_ID = 'C';
-- ----------------------------Employees-------------------------------------
#Number of employees of each department
select dep.dep_name, count(emp.emp_ID) as num
from employees as emp join jobs on emp.job_ID = jobs.job_ID
		right join departments as dep on jobs.dep_ID = dep.dep_ID
group by dep.dep_ID order by count(emp.emp_ID) desc;
-- ---------------------------Donation---------------------------------------
#sum of total
select d.donor_name, sum(dh.total) as sum_of_money
from donors as d join donation_history as dh 
	on d.donor_ID = dh.donor_ID
group by d.donor_ID;
#
select d.donor_name, sum(dh.total) as sum_of_money
from donors as d join donation_history as dh 
	on d.donor_ID = dh.donor_ID
where month(dh.donation_date) = 3
group by d.donor_ID;
#
