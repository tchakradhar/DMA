import React, { useState } from 'react';
import { Helmet } from 'react-helmet';
import brand from 'dan-api/dummy/brand';
import { PapperBlock } from 'dan-components';
import Button from '@material-ui/core/Button';
import SourceTable from '../SourceTable';
import Input from '@material-ui/core/Input';
import { FormControl } from '@material-ui/core';
import InputLabel from '@material-ui/core/InputLabel';

function JobCreation() {
  const handleSubmit = (evt) => {
    evt.preventDefault();
    console.log(`Submitting Name - ${name}`);
    evt.target.reset();
    // alert(`Submitting Name ${name}`)
  };
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
        <PapperBlock title="Job Creation " desc="" className="job-create">
          <div className="row">
            <div className="container">
              <div className="col-3" />
              <div className="col-5">
                <form onSubmit={handleSubmit}>
                  {/* <div className="form-group">
                    <label htmlFor="exampleInputEmail1">Name</label>
                    <input type="text" className="form-control" id="" aria-describedby="emailHelp" name="name" onChange={e => setName(e.target.value)} />

                  </div> */}
                   <FormControl className="col-12">
                      <InputLabel htmlFor="my-input"> Name</InputLabel>
                      <Input id="" aria-describedby="my-helper-text"  type="text" className="htmlForm-control" 
                       name="name"  onChange={e => setName(e.target.value)} required/>
                    </FormControl>
                    <div className="htmlForm-group mt-3 ">
                          <Button
                            type="submit"
                            variant="contained"
                            color="primary"
                            size="large"
                            className="px-4"
                          >
                              Submit
                          </Button>
                          <Button
                            variant="contained"
                            className="danger ml-3 px-4 text-white"
                            size="large"
                            type="reset"
                          >
                              Cancel
                          </Button>
                          <Button
                            variant="contained"
                            className=" px-4 text-white "
                            size="large"
                            color="primary"
                            onClick={onClick}
                            style ={{marginLeft : '4em'}}
                          >
                              Next
                          </Button>
                    </div>
                         
                  {/* <a className="next-btn-margin btn btn-primary " onClick={onClick}>
                    {' '}
Next
                  </a> */}
                
                </form>
              </div>
              <div className="col-3" />
            </div>

          </div>
        </PapperBlock>
      ) : null }
      { showResults ? <SourceTable /> : null }

    </div>
  );
}

export default JobCreation;
