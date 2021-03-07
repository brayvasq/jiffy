import React, { useState, useEffect } from "react";

const ListComponent = (props) => {
  const [list, setList] = useState([]);

  const createdTasks = (item) => {
    return (
      <p>
        {item.id} {item.title} - {item.description} - {item.created_at}
      </p>
    );
  };

  const getExpenses = async () => {
    const url = "http://localhost:3000/api/v1/tasks";
    const request = await fetch(url);
    const response = await request.json();
    setList(response);
  };

  useEffect(async () => {
    const interval = setInterval(getExpenses, 1000);
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

export default ListComponent;
