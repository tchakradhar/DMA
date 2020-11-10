import React,{useState}from 'react';
import { Helmet } from 'react-helmet';
import brand from 'dan-api/dummy/brand';
import { PapperBlock } from 'dan-components';
import { makeStyles } from '@material-ui/core/styles';
import List from '@material-ui/core/List';
import ListItem from '@material-ui/core/ListItem';
import ListItemIcon from '@material-ui/core/ListItemIcon';
import ListItemSecondaryAction from '@material-ui/core/ListItemSecondaryAction';
import ListItemText from '@material-ui/core/ListItemText';
import Checkbox from '@material-ui/core/Checkbox';
import AppBar from '@material-ui/core/AppBar';
import Toolbar from '@material-ui/core/Toolbar';
import IconButton from '@material-ui/core/IconButton';
import Typography from '@material-ui/core/Typography';
import CloseIcon from '@material-ui/icons/Close';
import Slide from '@material-ui/core/Slide';
import Dialog from '@material-ui/core/Dialog';
import Button from '@material-ui/core/Button';
import Divider from '@material-ui/core/Divider';
import MUIDataTable from "mui-datatables";
import Icon from '@material-ui/core/Icon';

// datatables
const useStyles = makeStyles((theme) => ({
    root: {
      width: '100%',
      maxWidth: 360,
      backgroundColor: theme.palette.background.paper,
    },
    appBar: {
        position: 'relative',
      },
      title: {
        marginLeft: theme.spacing(2),
        flex: 1,
      },
  }));
  
  const Transition = React.forwardRef(function Transition(props, ref) {
    return <Slide direction="up" ref={ref} {...props} />;
  });


  const columns = [
    {
     name: "connectionName",
     label: "Connection Name",
     options: {
      filter: true,
      sort: true,
     }
    },
    {
     name: "hostname",
     label: "Host Name",
     options: {
      filter: true,
      sort: false,
     }
    },
    {
     name: "port",
     label: "Port",
     options: {
      filter: true,
      sort: false,
     }
    },
    {
     name: "userName",
     label: "User Name",
     options: {
      filter: true,
      sort: false,
     }
    },
    {
      name: "Connect",
      options: {
        filter: true,
        sort: true,
       
        customBodyRender: (value, tableMeta, updateValue) => {
          return (
            <button onClick={() => window.alert(`Clicked "Connect" for row ${tableMeta.rowIndex}`)}
            className="btn btn-primary">
              Connect
            </button>
          );
        }
      }
    },
   ];
    
   const data = [
    { connectionName: "MSSQL1", hostname: "localhost", port: "81", userName: "demo" },
    { connectionName: "MSSQL1", hostname: "localhost", port: "81", userName: "demo" },
    { connectionName: "MSSQL1", hostname: "localhost", port: "81", userName: "demo" },
    { connectionName: "MSSQL1", hostname: "localhost", port: "81", userName: "demo" },
    { connectionName: "MSSQL1", hostname: "localhost", port: "81", userName: "demo" },
   ];
    
  //  const options = {
  //    filterType: 'checkbox',
  //  };
function SourceTable(props, ref) {
 
  

    const classes = useStyles();
    // const [checked, setChecked] = React.useState([0]);
    const handleClickOpen = () => {
        setOpen(true);
      };
    const handleClose = () => {
        setOpen(false);
      };
    
    const title = brand.name + ' - Dashboard';
    const description = brand.desc;
    const [open, setOpen] = React.useState(false);
  return (
    <div>
      <Helmet>
        <title>{title}</title>
        <meta name="description" content={description} />
        <meta property="og:title" content={title} />
        <meta property="og:description" content={description} />
        <meta property="twitter:title" content={title} />
        <meta property="twitter:description" content={description} />
      </Helmet>
      <PapperBlock title="Select Source Table " desc="">
      <div className="row">
          <div className="container ">
            <div className="col-5 search-results">
              <List className={classes.root}>
                <ListItem  dense button onClick={handleClickOpen}>
                        <ListItemIcon> 
                            <Checkbox
                            edge="start"
                            tabIndex={-1}
                            disableRipple
                            className='checkbox'
                        /></ListItemIcon>
                        <ListItemText>Amazon RedShift</ListItemText>
                </ListItem>
                <ListItem  dense button onClick={handleClickOpen}>
                        <ListItemIcon> 
                            <Checkbox
                            edge="start"
                            tabIndex={-1}
                            disableRipple
                        /></ListItemIcon>
                        <ListItemText>PostgreSQL</ListItemText>
                </ListItem>
                <ListItem  dense button onClick={handleClickOpen}>
                        <ListItemIcon> 
                            <Checkbox
                            edge="start"
                            tabIndex={-1}
                            disableRipple
                        /></ListItemIcon>
                        <ListItemText>Oracle</ListItemText>
                </ListItem>
                <ListItem  dense button onClick={handleClickOpen}>
                        <ListItemIcon> 
                            <Checkbox
                            edge="start"
                            tabIndex={-1}
                            disableRipple
                        /></ListItemIcon>
                        <ListItemText>MS SQL Server</ListItemText>
                </ListItem>
                <ListItem  dense button  onClick={handleClickOpen}>
                        <ListItemIcon> 
                            <Checkbox
                            edge="start"
                            tabIndex={-1}
                            disableRipple
                            // onClick={OpenMysqModel}
                        /></ListItemIcon>
                        <ListItemText >MYSQL</ListItemText>
                </ListItem>
            </List>
              <Dialog fullScreen open={open} onClose={handleClose} TransitionComponent={Transition}>
                <AppBar className={classes.appBar}>
                  <Toolbar>
                    <IconButton edge="start" color="inherit" onClick={handleClose} aria-label="close">
                      <CloseIcon />
                    </IconButton>
                    <Typography variant="h6" className={classes.title}>
                      Choose Connection
                    </Typography>
                    
                  </Toolbar>
                </AppBar>
                <div className="row mx-0">
                    <div className="container">
                        {/* <div className="col-1"></div> */}
                        <div className="col-12">
                        <MUIDataTable
                          title={"Connection List"}
                          data={data}
                          columns={columns}
                          // options={options}
                        />
                        </div>

                    </div>
                </div>
              </Dialog>
          </div>
        </div>
        <div className="row ml-4 mt-3">
          <div className="container ">
            <a href="" className=""><Button
              variant="contained"
              color="primary"
              size="large"
              className={classes.button}
              endIcon={<Icon>send</Icon>}
              >
              Next
            </Button></a> 
          </div>
        </div>
      </div>
      </PapperBlock>
     
    </div>
  );
}

export default SourceTable;
