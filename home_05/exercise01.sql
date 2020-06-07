/*
Пусть задан некоторый пользователь. 
Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.
*/

SELECT from_user_id, COUNT(id) AS nambers_messeges FROM messages WHERE to_user_id in
(
(SELECT target_user_id FROM friend_requests WHERE initiator_user_id = 11 AND status = 'approved')
UNION
(SELECT initiator_user_id FROM friend_requests WHERE target_user_id = 11 AND status = 'approved')
) GROUP BY from_user_id ORDER BY nambers_messeges DESC LIMIT 1;