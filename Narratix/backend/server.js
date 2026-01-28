import express from 'express';
import cors from 'cors';
import bodyParser from 'body-parser';
import mongoose from 'mongoose';
import dotenv from 'dotenv';
dotenv.config();
const app=express();
const PORT=process.env.PORT||5500;
app.use(cors());
app.use(express.json());
app.get('/',(req,res)=>{
    res.send('Api is running....');
})
app.listen(PORT,console.log(`Server is running on port ${PORT}`));
mongoose.connect(process.env.MONGO_URI,{
    // useNewUrlParser:true,
    // useUnifiedTopology:true
}).then(()=>{
    console.log('MongoDB connected successfully');
}).catch((err)=>{
    console.log('MongoDB connection failed:',err.message);
});

