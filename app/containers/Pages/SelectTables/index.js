import { Helmet } from 'react-helmet';
import brand from 'dan-api/dummy/brand';
import { PapperBlock } from 'dan-components';
import React, { useState } from 'react';
import DualListBox from 'react-dual-listbox';
import { makeStyles } from '@material-ui/core/styles';
import Grid from '@material-ui/core/Grid';
import List from '@material-ui/core/List';
import ListItem from '@material-ui/core/ListItem';
import ListItemIcon from '@material-ui/core/ListItemIcon';
import ListItemText from '@material-ui/core/ListItemText';
import Checkbox from '@material-ui/core/Checkbox';
import Button from '@material-ui/core/Button';
import Paper from '@material-ui/core/Paper';
// Dual box using functional components
import Icon from '@material-ui/core/Icon';
import TargetSchema from '../TargetSchema';

const useStyles = makeStyles((theme) => ({
  root: {
    margin: 'auto',
  },
  paper: {
    width: 350,
    height: 450,
    overflow: 'auto',
  },
  button: {
    margin: theme.spacing(0.5, 0),
  },
}));

function not(a, b) {
  return a.filter((value) => b.indexOf(value) === -1);
}

function intersection(a, b) {
  return a.filter((value) => b.indexOf(value) !== -1);
}

function SelectTables() {
  const [showResults, setShowResults] = React.useState(false);
  const [showResultsCreate, setShowResultsCreate] = React.useState(true);

  const onClick = () => {
    setShowResults(true);
    setShowResultsCreate(false);
  };
  
  const classes = useStyles();
  const [checked, setChecked] = React.useState([]);
  const [left, setLeft] = React.useState([0, 1, 2, 3]);
  const [right, setRight] = React.useState([4, 5, 6, 7]);

  const leftChecked = intersection(checked, left);
  const rightChecked = intersection(checked, right);

  const handleToggle = (value) => () => {
    const currentIndex = checked.indexOf(value);
    const newChecked = [...checked];

    if (currentIndex === -1) {
      newChecked.push(value);
    } else {
      newChecked.splice(currentIndex, 1);
    }

    setChecked(newChecked);
  };

  const handleAllRight = () => {
    setRight(right.concat(left));
    setLeft([]);
  };

  const handleCheckedRight = () => {
    setRight(right.concat(leftChecked));
    setLeft(not(left, leftChecked));
    setChecked(not(checked, leftChecked));
  };

  const handleCheckedLeft = () => {
    setLeft(left.concat(rightChecked));
    setRight(not(right, rightChecked));
    setChecked(not(checked, rightChecked));
  };

  const handleAllLeft = () => {
    setLeft(left.concat(right));
    setRight([]);
  };

  const customList = (items) => (
    <Paper className={classes.paper}>
      <List dense component="div" role="list">
        {items.map((value) => {
          const labelId = `transfer-list-item-${value}-label`;

          return (
            <ListItem key={value} role="listitem" button onClick={handleToggle(value)}>
              <ListItemIcon>
                <Checkbox
                  checked={checked.indexOf(value) !== -1}
                  tabIndex={-1}
                  disableRipple
                  inputProps={{ 'aria-labelledby': labelId }}
                />
              </ListItemIcon>
              <ListItemText id={labelId} primary={`Tables ${value + 1}`} />
            </ListItem>
          );
        })}
        <ListItem />
      </List>
    </Paper>
  );

  return (
    <div>
   { showResultsCreate ? ( <PapperBlock title="Select Tables" desc="">
      <Grid container spacing={2} justify="center" alignItems="center" className={classes.root}>

        <Grid item>{customList(left)}</Grid>
        <Grid item>
          <Grid container direction="column" alignItems="center">
            <Button
              variant="outlined"
              size="small"
              className={classes.button}
              onClick={handleAllRight}
              disabled={left.length === 0}
              aria-label="move all right"
            >
            ≫
            </Button>
            <Button
              variant="outlined"
              size="small"
              className={classes.button}
              onClick={handleCheckedRight}
              disabled={leftChecked.length === 0}
              aria-label="move selected right"
            >
            &gt;
            </Button>
            <Button
              variant="outlined"
              size="small"
              className={classes.button}
              onClick={handleCheckedLeft}
              disabled={rightChecked.length === 0}
              aria-label="move selected left"
            >
            &lt;
            </Button>
            <Button
              variant="outlined"
              size="small"
              className={classes.button}
              onClick={handleAllLeft}
              disabled={right.length === 0}
              aria-label="move all left"
            >
            ≪
            </Button>
          </Grid>
        </Grid>
        <Grid item>{customList(right)}</Grid>

      </Grid>
      <div className="row " style={{ marginLeft: '7em' }}>

        <a>
          <Button
            variant="contained"
            color="primary"
            size="large"
            className={classes.button}
            endIcon={<Icon>send</Icon>}
              onClick={onClick}
          >
              Next
          </Button>
        </a>

      </div>
    </PapperBlock> ): null }
    { showResults ? <TargetSchema /> : null }
    </div>
  );
}


// Dual box using class components

// import 'font-awesome/css/font-awesome.min.css';
// import FontAwesome from 'react-fontawesome'
// import faStyles from 'font-awesome/css/font-awesome.css'
// function SelectSchemas() {
// const options = [
//     { value: 'one', label: 'Option One' },
//     { value: 'two', label: 'Option Two' },
//     { value: 'threee', label: 'Option Three' },
//     { value: 'four', label: 'Option Four' },
//     { value: 'five', label: 'Option Five' },
//     { value: 'six', label: 'Option Six' },
//     { value: 'seven', label: 'Option Seven' },

// ];
// class SelectSchemas extends React.Component {
//     // state = {
//     //     selected: ['one'],
//     // };

//     // onChange = (selected) => {
//     //     this.setState({ selected });
//     // };

//   render() {
//     const title = brand.name + ' - Dashboard';
//     const description = brand.desc;
//     const { selected } = this.state;
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
//       <PapperBlock title="Select Schemas" desc="">
//         <div className="container" >
//             <div className="row search-results">

//                 {/* <DualListBox
//                 options={options}
//                 selected={selected}
//                 onChange={this.onChange}
//                 canFilter options={options}
//               /> */}

//             </div>
//         </div>
//       </PapperBlock>
//     </div>
//   );
//   }
// }

export default SelectTables;
