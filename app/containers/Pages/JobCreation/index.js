import React,{useState}from 'react';
import { Helmet } from 'react-helmet';
import brand from 'dan-api/dummy/brand';
import { PapperBlock } from 'dan-components';
import SourceTable from '../SourceTable';
import Button from '@material-ui/core/Button';

function JobCreation() {
  
  const handleSubmit = (evt) => {
    evt.preventDefault();
    console.log(`Submitting Name - ${name}`);
    evt.target.reset();
    // alert(`Submitting Name ${name}`)
}
const [showResults, setShowResults] = React.useState(false);
const [showResultsCreate, setShowResultsCreate] = React.useState(true);


const onClick = () => {
  setShowResults(true);
  setShowResultsCreate(false);
  
}

  const [name, setName] = useState("");
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
      { showResultsCreate ? <PapperBlock title="Job Creation " desc="" className="job-create">
      <div className="row">
          <div className="container">
          <div className="col-3"></div>
            <div className="col-5">
            <form onSubmit={handleSubmit}>
                <div className="form-group">
                  <label htmlFor="exampleInputEmail1">Name</label>
                  <input type="text" className="form-control" id="" aria-describedby="emailHelp" name="name"  onChange={e => setName(e.target.value)}/>
                
                </div>
                <button type="submit" className="btn btn-primary">Submit</button>
                <button type="reset" className="btn btn-primary ml-2">Cancel</button>
                <a  className="next-btn-margin btn btn-primary " onClick={onClick}> Next
               </a>
               {/* <Button variant="outlined" className="next-btn-margin btn btn-primary "  color="primary" >
               Next
              </Button> */}
            </form>
            </div>
            <div className="col-3"></div>
          </div>
     
      </div>
      </PapperBlock>: null }
      { showResults ? <SourceTable /> : null }
     
    </div>
  );
}

export default JobCreation;
