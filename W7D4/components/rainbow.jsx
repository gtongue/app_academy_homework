import React from 'react';
import {
  Route,
  Link,
  NavLink
} from 'react-router-dom';

import Red from './red';
import Green from './green';
import Blue from './blue';
import Violet from './violet';
import Yellow from './yellow';
import Orange from './orange';
import Indigo from './indigo';

class Rainbow extends React.Component {
  render() {
    return (
      <div>
        <h1>Rainbow Router!</h1>
        <NavLink to='/red' >Red</NavLink>
        <NavLink to='/green' >Green</NavLink>
        <NavLink to='/blue' >Blue</NavLink>
        <NavLink to='/violet' >Violet</NavLink>
        <NavLink to='/yellow' >Yellow</NavLink>
        <NavLink to='/orange' >Orange</NavLink>
        <NavLink to='/indigo' >Indigo</NavLink>
        <div id="rainbow">
          <Route path="/red" component={Red} />
          <Route path="/green" component={Green} />
          <Route path="/blue" component={Blue} />
          <Route path="/violet" component={Violet} />
          <Route path="/yellow" component={Yellow} />
          <Route path="/orange" component={Orange} />
          <Route path="/indigo" component={Indigo} />
        </div>
      </div>
    );
  }
};

export default Rainbow;
