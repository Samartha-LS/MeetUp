use MeetUp

select * from Appointment

select * from Appointment where  ToEmployeeId = 7004 and Date = '2018-09-11' and ((FromTime <= '15:00:00' AND ToTime >= '15:00:00')OR
(FromTime <= '18:00:00' AND ToTime >= '18:00:00')or
(FromTime >= '15:00:00' AND ToTime <= '18:00:00'));