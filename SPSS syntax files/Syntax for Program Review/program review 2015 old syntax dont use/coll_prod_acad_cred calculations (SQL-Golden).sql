select distinct a.acad_credentials_id,
                a.acad_person_id,
                a.acad_term,
                a.acad_start_date,
                (case
                  when f.gender = 'F' then
                   '2.Female'
                  when f.gender = 'M' then
                   '1.Male'
                  else
                   '3. Not Reported'
                end) as gender,
                (case
                  when coll_production.xf_get_per_races(f.id) =
                       'International' then
                   '1.Nonresident Alien'
                  when coll_production.xf_get_per_ethnics(f.id) =
                       'Hispanic/Latino' then
                   '2.Hispanic / Latino'
                  when coll_production.xf_get_per_races(f.id) =
                       'American/Alaska Native' then
                   '3.American Indian or Alaska Native'
                  when coll_production.xf_get_per_races(f.id) = 'Asian' then
                   '4.Asian'
                  when coll_production.xf_get_per_races(f.id) =
                       'Black or African American' then
                   '5.Black or African American'
                  when coll_production.xf_get_per_races(f.id) =
                       'Hawaiian/Pacific Islander' then
                   '6.Native Hawaiian or Other Pacific Islander'
                  when coll_production.xf_get_per_races(f.id) = 'White' then
                   '7.White'
                  when coll_production.xf_get_per_races(f.id) = 'Multi' then
                   '8.Two or more races'
                  when coll_production.xf_get_per_races(f.id) =
                       'Race Unknown' then
                   '9.Race and ethnicity unknown'
                  when (coll_production.xf_get_per_races(f.id) is null and
                       coll_production.xf_get_per_ethnics(f.id) is null) then
                   '9.Race and ethnicity unknown'
                  else
                   '9.Race and ethnicity unknown'
                end) as ethnicity,
               (select distinct trunc(months_between(a1.acad_degree_date,
                                                      f.birth_date) / 12)
                   from coll_production.acad_credentials a1
                  where a1.acad_person_id = a.acad_person_id
                    and a1.acad_degree_date =
                        (select max(a2.acad_degree_date)
                           from coll_production.acad_credentials a2
                          where a2.acad_person_id = a.acad_person_id)) as age,
                (case
                  when (select distinct trunc(months_between(a1.acad_degree_date,
                                                             f.birth_date) / 12)
                          from coll_production.acad_credentials a1
                         where a1.acad_person_id = a.acad_person_id
                           and a1.acad_degree_date =
                               (select max(a2.acad_degree_date)
                                  from coll_production.acad_credentials a2
                                 where a2.acad_person_id = a.acad_person_id)) < '18' then
                   '1.Under 18'
                  when (select distinct trunc(months_between(a1.acad_degree_date,
                                                             f.birth_date) / 12)
                          from coll_production.acad_credentials a1
                         where a1.acad_person_id = a.acad_person_id
                           and a1.acad_degree_date =
                               (select max(a2.acad_degree_date)
                                  from coll_production.acad_credentials a2
                                 where a2.acad_person_id = a.acad_person_id)) between '18' and '24' then
                   '2. 18-24'
                  when (select distinct trunc(months_between(a1.acad_degree_date,
                                                             f.birth_date) / 12)
                          from coll_production.acad_credentials a1
                         where a1.acad_person_id = a.acad_person_id
                           and a1.acad_degree_date =
                               (select max(a2.acad_degree_date)
                                  from coll_production.acad_credentials a2
                                 where a2.acad_person_id = a.acad_person_id)) between '25' and '39' then
                   '3. 25-39'
                  when (select distinct trunc(months_between(a1.acad_degree_date,
                                                             f.birth_date) / 12)
                          from coll_production.acad_credentials a1
                         where a1.acad_person_id = a.acad_person_id
                           and a1.acad_degree_date =
                               (select max(a2.acad_degree_date)
                                  from coll_production.acad_credentials a2
                                 where a2.acad_person_id = a.acad_person_id)) > '39' then
                   '4. 40 and above'
                  else
                   '5. Age Unknown'
                end) as age_range,

                h.acpg_cip as cip,
                (case
                  when h.acpg_cmpl_months < 13 then
                   '1'
                  when h.acpg_cmpl_months > 12 and
                       a.acad_degree in ('CRT', 'FOS') then
                   '2'
                  when h.acpg_cmpl_months > 12 and
                       a.acad_degree not in ('CRT', 'FOS') then
                   '3'
                end) as award_level,
                h.acpg_title,
                e.omaj_desc,
    a.acad_location
  from coll_production.acad_credentials    a,
       coll_production.person              f,
       coll_production.acad_programs       h,
       coll_production.other_majors        e,
       coll_production.acad_credentials_ls b
where acad_institutions_id = '0000001'
   and acad_acad_program = h.acad_programs_id(+)
   and acad_person_id = f.id
  and a.acad_credentials_id = b.acad_credentials_id
   and b.acad_majors = e.other_majors_id(+)
   and e.omaj_desc ='Associate of Arts'
   and a.acad_term  IS NOT NULL ;
