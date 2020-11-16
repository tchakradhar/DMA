import React, { useState } from 'react';
import { Helmet } from 'react-helmet';
import brand from 'dan-api/dummy/brand';
import { PapperBlock } from 'dan-components';
import Button from '@material-ui/core/Button';

function SelectedSchemaView() {
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
        <PapperBlock title=" Selcted Schema List " desc="" className="job-create">
          <div className="row">
            <div className="container">
                    selcted Schema list works
            </div>

          </div>
        </PapperBlock>
      ) : null }
      { showResults ? <SourceTable /> : null }

    </div>
  );
}

export default SelectedSchemaView;
