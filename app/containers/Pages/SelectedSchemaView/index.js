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


const useRowStyles = makeStyles({
    root: {
      '& > *': {
        borderBottom: 'unset',
      },
    },
  });

  function createData(id, column, datatype) {
    return {
        id,
      column,
      datatype,
      history: [
        { date: '2020-01-05', customerId: '11091700'},
        { date: '2020-01-02', customerId: 'Anonymous' },
      ],
    };
  }
  function Row(props) {
    let [formData, setTarget] = useState({
       
        column : '',
        datatype : ''
      });

      let handleChange = (e) => {
        let name = e.target.name;
        let value = e.target.value;
        formData[name] = value;
        setTarget(formData);
      }
      
    const { row } = props;
    const [open, setOpen] = React.useState(false);
    const classes = useRowStyles();
  
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
          <TableCell align="right">{row.column}</TableCell>
          <TableCell align="right">{row.datatype}</TableCell>
          
          {/* <TableCell align="right">{row.fat}</TableCell>
          <TableCell align="right">{row.carbs}</TableCell>
          <TableCell align="right">{row.protein}</TableCell> */}
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
                            <Input value={historyRow.column} type="text" onChange={handleChange} name="column"></Input>
                          {/* {historyRow.date} */}
                        </TableCell>
                        <TableCell>
                            <Input value={historyRow.datatype} type="text" onChange={handleChange} name="datatype"></Input>
                        </TableCell>
                       
                       
                      </TableRow>
                    ))}
                    <TableRow>
                    <TableCell>
                            {/* <Input type="submit" variant="contained" color="primary" value="Update"></Input> */}
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
    //   calories: PropTypes.number.isRequired,
    //   carbs: PropTypes.number.isRequired,
    //   fat: PropTypes.number.isRequired,
      history: PropTypes.arrayOf(
        PropTypes.shape({
        //   amount: PropTypes.number.isRequired,
          column: PropTypes.string,
          datatype: PropTypes.string,
        }),
      ),
    //   column: PropTypes.string.isRequired,
    //   datatype: PropTypes.string.isRequired,
    //   protein: PropTypes.number.isRequired,
    }).isRequired,
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
        <PapperBlock title=" Selcted Schema List " desc="" className="job-create">
          <div className="row">
            <div className="container">
                <div className="col-6">
                    <TableContainer component={Paper}>
                        <Table aria-label="collapsible table">
                            <TableHead>
                            <TableRow>
                                <TableCell />
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
                <div className="col-6">

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
