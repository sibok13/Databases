/*
Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.
*/

SELECT user_id, COUNT(user_id) FROM (SELECT user_id FROM likes
UNION ALL
SELECT user_id FROM media
UNION ALL
SELECT from_user_id as user_id FROM messages
UNION ALL
SELECT initiator_user_id as user_id FROM friend_requests
) as t GROUP BY user_id ORDER BY COUNT(user_id) LIMIT 10;
