import React, { useState } from 'react';
import ReactDOM from 'react-dom';
import { Helmet } from 'react-helmet';
import brand from 'dan-api/dummy/brand';
import { PapperBlock } from 'dan-components';
import Button from '@material-ui/core/Button';
import PropTypes from 'prop-types';
import { makeStyles } from '@material-ui/core/styles';
import Box from '@material-ui/core/Box';
import Collapse from '@material-ui/core/Collapse';
import IconButton from '@material-ui/core/IconButton';
import Table from '@material-ui/core/Table';
import TableBody from '@material-ui/core/TableBody';
import TableCell from '@material-ui/core/TableCell';
import TableContainer from '@material-ui/core/TableContainer';
import TableHead from '@material-ui/core/TableHead';
import TableRow from '@material-ui/core/TableRow';
import Typography from '@material-ui/core/Typography';
import Paper from '@material-ui/core/Paper';
import KeyboardArrowDownIcon from '@material-ui/icons/KeyboardArrowDown';
import KeyboardArrowUpIcon from '@material-ui/icons/KeyboardArrowUp';
import Input from '@material-ui/core/Input';
import { ContentState } from 'draft-js';


  const useRowStyles = makeStyles({
    root: {
      '& > *': {
        borderBottom: 'unset',
      },
    },
  });

  function createData(id, schemaName, tableName) {
    return {
        id,
        schemaName,
        tableName,
      history: [
        { column: 'emp_name', datatype: 'varchar'},
        { column: 'dept_name', datatype: 'varchar' },
      ],
    };
  }

  

  function Row(props) {

    const { row } = props;
    console.log('data', props.row.history[0].column);
    const [open, setOpen] = React.useState(false);
    const classes = useRowStyles();

    let [formData, setFormData] = useState({
       
      column: props.row.history[0].column,
      datatype: props.row.history[0].datatype
    });
  
    let handleChange = (e) => {
      setFormData({
        column: e.target.name.value,
        datatype: e.target.name.value,
        // let name = e.target.name;
        // let value = e.target.value;
        // formData[name] = value;
        // setTarget(formData);
      });
    };
    
    return (
      <React.Fragment>
        <TableRow className={classes.root}>
          <TableCell>
            <IconButton aria-label="expand row" size="small" onClick={() => setOpen(!open)}>
              {open ? <KeyboardArrowUpIcon /> : <KeyboardArrowDownIcon />}
            </IconButton>
          </TableCell>
          <TableCell component="th" scope="row">
            {row.id}
          </TableCell>
          <TableCell align="right">{row.schemaName}</TableCell>
          <TableCell align="right">{row.tableName}</TableCell>
        </TableRow>
        <TableRow>
          <TableCell style={{ paddingBottom: 0, paddingTop: 0 }} colSpan={6}>
            <Collapse in={open} timeout="auto" unmountOnExit>
              <Box margin={1}>
                <Typography variant="h6" gutterBottom component="div">
                    Change Source Column and Datatype
                </Typography>
                <Table size="small" aria-label="purchases">
                  <TableHead>
                    <TableRow>
                      <TableCell> Column</TableCell>
                      <TableCell> Data Type</TableCell>
                      
                    </TableRow>
                  </TableHead>
                  <TableBody>
                  {row.history.map((historyRow) => (
                      <TableRow key={historyRow.id}>
                        <TableCell component="th" scope="row">
                            <Input  type="text"  name="column" onChange={handleChange} value={formData.column}></Input>
                          {/* {historyRow.date} */}
                        </TableCell>
                        <TableCell>
                            <Input  type="text" name="datatype"  onChange={handleChange} value={formData.datatype}></Input>
                        </TableCell>
                       
                       
                      </TableRow>
                    ))}
                   
                    <TableRow>
                      <TableCell>
                        <div className="btn-group" role="group">
                            <Button variant="contained" color="primary" type="submit">
                                Update
                            </Button>
                            <Button variant="contained" color="danger" className="ml-3 danger text-white" type="cancel">
                                Cancel
                            </Button>
                        </div>
                      </TableCell>
                    </TableRow>
                  </TableBody>
                </Table>
              </Box>
            </Collapse>
          </TableCell>
        </TableRow>
      </React.Fragment>
    );
  }

  Row.propTypes = {
    row: PropTypes.shape({
      schemaName: PropTypes.string.isRequired,
      tableName: PropTypes.string.isRequired,
     
      history: PropTypes.arrayOf(
        PropTypes.shape({
         
          column: PropTypes.any,
          datatype: PropTypes.any
        })
      ).isRequired,
     
    }).isRequired
  };


  const rows = [
    createData(1,'migration', 'configuration'),
    createData(2,'migration', 'create_job'),
    createData(3,'migration', 'job_list'),
    createData(4,'migration', 'job_config'),
    createData(5,'migration', 'job_view')
  ];

 


   function SelectedSchemaView() {
 
      const [showResults, setShowResults] = React.useState(false);
      const [showResultsCreate, setShowResultsCreate] = React.useState(true);

      const onClick = () => {
        setShowResults(true);
        setShowResultsCreate(false);
      };
      
      // const [targetFormData, setTargetFormData] = useState({
      //   ttname: targetrows.ttname
       
      // });
      // alert(targetrows.ttname);
     
      // const handleTargetData = (e) => {
      //   // alert('dddd');
      //   setTargetFormData({
      //     ttname: e.target.name.value,
      //     // let name = e.target.name;
      //     // let value = e.target.value;
      //     // formData[name] = value;
      //     // setTarget(formData);
      //   });
      // };

      const targetrows = [
        {id:1, tsname :'migration',ttname : 'configuration'},
        {id:2, tsname :'migration',ttname : 'create_job'}, 
        {id:3, tsname :'migration',ttname : 'job_list'},
        {id:4, tsname :'migration',ttname : 'job_config'},
        {id:5, tsname :'migration',ttname : 'job_view'},
    
      ];
      console.log(targetrows, 'sample data');
      
      const [name, setName] = useState('');
      const title = brand.name + ' - Dashboard';
      const description = brand.desc;
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
          { showResultsCreate ? (
            <PapperBlock title=" Selected Schema List " desc="" className="job-create">
              <div className="container">
                <div className="row">
                  <div className="col-sm">
                      <TableContainer component={Paper}>
                            <Table aria-label="collapsible table">
                                <TableHead>
                                  <TableRow>
                                      <TableCell />
                                      <TableCell>S.No</TableCell>
                                      <TableCell>Source Schema</TableCell>
                                      <TableCell align="right">Source Table Name</TableCell>
                                  </TableRow>
                                </TableHead>
                                <TableBody>
                                    {rows.map((row) => (
                                        <Row key={row.id} row={row} />
                                    ))}
                                </TableBody>
                            </Table>
                        </TableContainer>
                  </div>
                  <div className="col-sm">
                    <TableContainer component={Paper}>
                      <Table  aria-label="caption table">
                        <TableHead>
                          <TableRow>
                            <TableCell>S.No</TableCell>
                            <TableCell>Target Schema</TableCell>
                            <TableCell align="right">	Target Table Name</TableCell>
                          </TableRow>
                        </TableHead>
                        <TableBody>
                          {targetrows.map((row) => (
                            <TableRow key={row.id}>
                              <TableCell align="right">{row.id}</TableCell>
                              <TableCell align="right">
                                {row.tsname}
                              </TableCell>
                              {/* <TableCell align="right">{row.ttname}</TableCell> */}
                              <TableCell align="right">
                                {/* <Input  type="text" name="ttname" onChange={handleTargetData} 
                                 value={row.ttname}/> */}
                                   <Input  type="text" name="ttname"  
                                 value={row.ttname}/>
                              </TableCell>
                              
                            </TableRow>
                          ))}
                        </TableBody>
                        </Table>
                    </TableContainer>
                  </div>
                  
                </div>
              </div>
              
            </PapperBlock>
          ) : null }
          { showResults ? <SourceTable /> : null }
        </div>
      );
  }

export default SelectedSchemaView;
