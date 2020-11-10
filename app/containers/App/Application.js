import React, { useContext } from 'react';
import { PropTypes } from 'prop-types';
import { Switch, Route } from 'react-router-dom';
import Dashboard from '../Templates/Dashboard';
import { ThemeContext } from './ThemeWrapper';
import {
  Parent,
  DashboardPage,
  BlankPage,
  Form,
  Table,
  Error,
  NotFound,
  CreateConnection,
  JobCreation,
  Configuration,
  SourceTable,
  SelectSchemas
} from '../pageListAsync';
// import CreateConnection from '../Pages/CreateConnection';
function Application(props) {
  const { history } = props;
  const changeMode = useContext(ThemeContext);
  return (
    <Dashboard history={history} changeMode={changeMode}>
      <Switch>
        <Route exact path="/" component={BlankPage} />
        <Route path="/app/connection" component={CreateConnection} />
        <Route path="/app/configuration" component={Configuration} />
        <Route path="/app/job-creation" component={JobCreation} />

        <Route path="/app/dashboard" component={DashboardPage} />
        <Route path="/app/source" component={SourceTable} />
        <Route path="/app/schemas" component={SelectSchemas} />

        
        {/* <Route path="/app/form" component={Form} />
        <Route path="/app/table" component={Table} />
        <Route path="/app/page-list" component={Parent} />
        <Route path="/app/pages/not-found" component={NotFound} />
        <Route path="/app/pages/error" component={Error} /> */}
        <Route component={NotFound} />
      </Switch>
    </Dashboard>
  );
}

Application.propTypes = {
  history: PropTypes.object.isRequired,
};

export default Application;
