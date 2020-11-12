import React, {useState} from 'react';
import { Helmet } from 'react-helmet';
import brand from 'dan-api/dummy/brand';
import { PapperBlock } from 'dan-components';
import PropTypes from 'prop-types';
import { withStyles } from '@material-ui/core/styles';
import AppBar from '@material-ui/core/AppBar';
import Tabs from '@material-ui/core/Tabs';
import Tab from '@material-ui/core/Tab';
import Typography from '@material-ui/core/Typography';

import LinearProgress from '@material-ui/core/LinearProgress';
import Chip from '@material-ui/core/Chip';
import MUIDataTable from 'mui-datatables';
import BorderColor from '@material-ui/icons/BorderColor';
import DeleteForever from '@material-ui/icons/DeleteForever';
import Icon from '@material-ui/core/Icon';
import Dialog from '@material-ui/core/Dialog';
import DialogActions from '@material-ui/core/DialogActions';
import DialogContent from '@material-ui/core/DialogContent';
import DialogContentText from '@material-ui/core/DialogContentText';
import DialogTitle from '@material-ui/core/DialogTitle';
// function Configuration() {
//   const title = brand.name + ' - Dashboard';
//   const description = brand.desc;
//   return (
//     <div>
//       <Helmet>
//         <title>{title}</title>
//         <meta name="description" content={description} />
//         <meta property="og:title" content={title} />
//         <meta property="og:description" content={description} />
//         <meta property="twitter:title" content={title} />
//         <meta property="twitter:description" content={description} />
//       </Helmet>
//       <PapperBlock title="Configuration " desc="">
//       <div>
//           <p>Configuration  work</p>
//       </div>
//       </PapperBlock>
     
//     </div>
//   );
// }
function TabContainer(props) {
  const { children } = props;
  return (
    <Typography component="div" style={{ padding: 8 * 3 }}>
      {children}
    </Typography>
  );
}

TabContainer.propTypes = {
  children: PropTypes.node.isRequired,
};

const styles = theme => ({
  root: {
    flexGrow: 1,
    width: '100%',
    backgroundColor: theme.palette.background.paper,
  },
});

// handlebtnclick = () => {
//   alert('hii');

//  };
//Advanced data tables start
const columns = ["Name", "Host Name", "Port", "Database", "Username",
{
  name: "Actions",
  options: {
    filter: true,
    sort: true,
   
    customBodyRender: (value, tableMeta, updateValue) => {
      return (
        <Icon onClick={() => window.alert(`Clicked "Edit" for row ${tableMeta.rowIndex}`)}>edit</Icon>
        // <button onClick={() => window.alert(`Clicked "Edit" for row ${tableMeta.rowIndex}`)}>
        //   Edit
        // </button>
      );
    }
  }
},
{
  // icon : <Icon >edit</Icon>,
  // name: "Delete",
  options: {
    filter: true,
    sort: true,
    // empty: true,
    customBodyRender: (value, tableMeta, updateValue) => {
      return (
        <Icon onClick={() => {
            const { data } = this.state;
            data.shift();
            this.setState({ data });
          }} >delete_forever</Icon>
        // <button onClick={() => {
        //   const { data } = this.state;
        //   data.shift();
        //   this.setState({ data });
        // }}>
        //   Delete
        // </button>
      );
    }
  }
}
];
const configurationData =
 { code :200, message: 'success', data : 
  [
    ["RS", "test-sss.cmx3j5mpskak.us-east-1.redshift.amazonaws.com", "5439", "test_sss", "admin"],
    // <Icon>edit</Icon>,<Icon>delete_forever</Icon>,<Icon>offline_pin</Icon>
    ["Demo_Job", "test-sss.cmx3j5mpskak.us-east-1.redshift.amazonaws.com", "5439", "test_sss_demo", "admin"],
    ["RS", "test-sss.cmx3j5mpskak.us-east-1.redshift.amazonaws.com", "5439", "demo", "admin"],
   ]
} 

//  <div className="btn-group"><Icon >edit</Icon><Icon>delete_forever</Icon><Icon>check_circle</Icon></div>

 const options = {
  // filterType: 'checkbox',
  filterType: 'dropdown',
    responsive: 'stacked',
};
//Advanced data tables end

class Configuration extends React.Component {
  state = {
    value: 0,
    open: false,
  };
  handleClickOpen = () => {
    this.setState({ open: true });
  };

  handleClose = () => {
    this.setState({ open: false });
  };

  handleChange = (event, value) => {
    this.setState({ value });
  };

  render() {
    const title = brand.name + ' - Dashboard';
    const description = brand.desc;
    const { classes } = this.props;
    const { value } = this.state;
    const { open } = this.state;
    return (
      <div>
      <div className={classes.root}  style={{'borderRadius':'5%'}}>
        <Helmet>
         <title>{title}</title>
         <meta name="description" content={description} />
         <meta property="og:title" content={title} />
         <meta property="og:description" content={description} />
         <meta property="twitter:title" content={title} />
         <meta property="twitter:description" content={description} />
       </Helmet>
          <PapperBlock title="Available Connections " desc="">
            <AppBar position="static" color="default"  style={{alignItems:'center'}}>
              <Tabs
                value={value}
                onChange={this.handleChange}
                indicatorColor="secondary"
                textColor="secondary"
                variant="scrollable"
                scrollButtons="auto"
                style={{outline:'none'}}
              >
                <Tab label="Amazon RedShift" />
                <Tab label="Oracle" />
                <Tab label="MS SQL Server" />
                <Tab label="MySQL" />
                <Tab label="Snow Flake" />
                {/* <Tab label="Item Six" />
                <Tab label="Item Seven" /> */}
              </Tabs>
            </AppBar>
            {value === 0 && <TabContainer>
                <MUIDataTable
                  title={"Amazon RedShift"}
                  data={configurationData.data}
                  columns={columns}
                  options={options}
                />
              </TabContainer>}
            {value === 1 && <TabContainer>
                <MUIDataTable
                  title={"Oracle"}
                  data={configurationData.data}
                  columns={columns}
                  options={options}
                />
              </TabContainer>}
            {value === 2 && <TabContainer>
                <MUIDataTable
                  title={"MS SQL Server"}
                  data={configurationData.data}
                  columns={columns}
                  options={options}
                />
              </TabContainer>}
            {value === 3 && <TabContainer> 
              <MUIDataTable
                  title={"MySQL"}
                  data={configurationData.data}
                  columns={columns}
                  options={options}
                /></TabContainer>}
            {value === 4 && <TabContainer>
                <MUIDataTable
                  title={"Snowflake"}
                  data={configurationData.data}
                  columns={columns}
                  options={options}
                />
              </TabContainer>}
            {/* {value === 5 && <TabContainer>Item Six</TabContainer>}
            {value === 6 && <TabContainer>Item Seven</TabContainer>} */}
          </PapperBlock>

      </div>
    </div> 
    );
  }
}

Configuration.propTypes = {
  classes: PropTypes.object.isRequired,
};

export default withStyles(styles)(Configuration);

// export default Configuration;
