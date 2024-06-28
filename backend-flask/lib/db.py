from psycopg_pool import ConnectionPool
import os

connection_url = os.getenv("CONNECTION_URL")
pool = ConnectionPool(connection_url)





class Db:
  def __init__(self):
    self.init_pool()
  def init_pool():
    connection_url = os.getenv('CONNECTION_URL')
    self.pool = ConnectionPool(connection_url)
  def query_commit():
    try:
        conn = self.pool.connection()
        cur = conn.cursor():
        cur.execute(sql)
        conn.commit()
    except Exception as error:
      print(error)
  def query_wrap_object(template):
    sql = f"""
    (SELECT COALESCE(row_to_json(object_row),'{{}}'::json) FROM (
    {template}
    ) object_row);
    """
    return sql

  def query_wrap_array(template):
    sql = f"""
    (SELECT COALESCE(array_to_json(array_agg(row_to_json(array_row))),'[]'::json) FROM (
    {template}
    ) array_row);
    """
    return sql
