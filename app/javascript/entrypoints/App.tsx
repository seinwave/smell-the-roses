import React, { useEffect } from 'react';

export function App() {
  useEffect(() => {
    console.log('IT IS AN EFFECT');
  }, []);

  return (
    <div>
      <h1>I am the App Now</h1>
    </div>
  );
}
