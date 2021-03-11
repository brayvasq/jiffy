import React, { useState, useEffect } from "react";
import Task from "./Task";

const List = (props) => {
  const [list, setList] = useState([]);

  const createdTasks = (item) => {
    return (
      <Task
        key={item.id}
        id={item.id}
        title={item.title}
        description={item.description}
      />
    );
  };

  const getExpenses = async () => {
    const url = "/api/v1/tasks";
    const request = await fetch(url);
    const response = await request.json();
    setList(response);
  };

  useEffect(async () => {
    const interval = setInterval(getExpenses, 10_000);
    return () => clearInterval(interval);
  });

  const listItem = list.map(createdTasks);

  return (
    <div>
      <h1>Tasks</h1>
      <div>{listItem}</div>
    </div>
  );
};

export default List;
