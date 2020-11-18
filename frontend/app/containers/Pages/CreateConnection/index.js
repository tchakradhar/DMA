import React,{useState}from 'react';
import { Helmet } from 'react-helmet';
import brand from 'dan-api/dummy/brand';
import { PapperBlock } from 'dan-components';
import ReactDOM from 'react-dom';
import Input from '@material-ui/core/Input';
import { FormControl } from '@material-ui/core';
import InputLabel from '@material-ui/core/InputLabel';
import Select from '@material-ui/core/Select';
import MenuItem from '@material-ui/core/MenuItem';
import Button from '@material-ui/core/Button';

function CreateConnection() {
 
  const title = brand.name + ' - Dashboard';
  const description = brand.desc;
//  const[name,SetName]=useState('')
//  const[email,SetEmail]=useState('')
 let [htmlFormData, setAccount] = useState({
  connectionName: '',
  hostName: '',
  dataName: '',
  userName: '',
  type: '',
  port: '',
  password: ''
});

let handleChange = (e) => {
  let name = e.target.name;
  let value = e.target.value;
  htmlFormData[name] = value;
  setAccount(htmlFormData);
}
let onSubmit = (e) => {
  e.preventDefault();
  console.log(htmlFormData);
  e.target.reset();
}



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
      <PapperBlock title="Create New Connection  " desc="">
      <div>
      
            <form onSubmit={onSubmit} className="htmlForm ">
              <div className="row">
                <div className="col-6">
                    <FormControl className="col-12">
                      <InputLabel htmlFor="my-input">Connection Name</InputLabel>
                      <Input id="" aria-describedby="my-helper-text"  type="text" className="htmlForm-control" 
                       name="connectionName"  onChange={handleChange} required/>
                    </FormControl>
                    <FormControl className="col-12">
                      <InputLabel htmlFor="my-input">Host Name</InputLabel>
                      <Input id="" aria-describedby="my-helper-text"  type="text" className="htmlForm-control" 
                       name="hostName"  onChange={handleChange} required/>
                    </FormControl>
                    <FormControl className="col-12">
                      <InputLabel htmlFor="my-input">Database Name</InputLabel>
                      <Input id="" aria-describedby="my-helper-text"  type="text" className="htmlForm-control" 
                       name="dataName"  onChange={handleChange} required/>
                    </FormControl>
                    <FormControl className="col-12">
                      <InputLabel htmlFor="my-input">User Name</InputLabel>
                      <Input id="" aria-describedby="my-helper-text"  type="text" className="htmlForm-control" 
                       name="userName"  onChange={handleChange} required/>
                    </FormControl>
                </div>
                <div className="col-6">
                    <FormControl className="col-12">
                      <InputLabel htmlFor="my-input">Select Type</InputLabel>
                      <Select onChange={handleChange} name="type" required>
                        <MenuItem value="">
                          <em>None</em>
                        </MenuItem>
                        <MenuItem value="Amazon RedShift">Amazon RedShift</MenuItem>
                        <MenuItem value="Oracle">Oracle</MenuItem>
                        <MenuItem value="MS SQL Server">MS SQL Server</MenuItem>
                        <MenuItem value="MySQL">MySQL</MenuItem>
                        <MenuItem value="Snow_Flake">Snow Flake</MenuItem>
                      </Select>
                    </FormControl>
                    <FormControl className="col-12">
                      <InputLabel htmlFor="my-input">Port</InputLabel>
                      <Input id="" aria-describedby="my-helper-text"  type="text" className="htmlForm-control" 
                       name="port"  onChange={handleChange} required/>
                    </FormControl>
                    <FormControl className="col-12">
                      <InputLabel htmlFor="my-input">Password</InputLabel>
                      <Input id="" aria-describedby="my-helper-text"  type="password" className="htmlForm-control" 
                       name="password"  onChange={handleChange} required/>
                    </FormControl>
                    <div className="htmlForm-group mt-3 ">
                          <Button
                            type="submit"
                            variant="contained"
                            color="primary"
                            size="large"
                            className="px-5"
                          >
                              Submit
                          </Button>
                          <Button
                            variant="contained"
                            className="danger ml-3 px-5 text-white"
                            size="large"
                            type="reset"
                          >
                              Cancel
                          </Button>
                    </div>
                </div>
              </div>
            </form>
      </div>
      </PapperBlock>
    </div>
  );
}

export default CreateConnection;
