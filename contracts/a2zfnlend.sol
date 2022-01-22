pragma solidity 0.8.11;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract p2ploan {  

uint256 public activeLoans = 0;
mapping(address => uint256) public lendersBalance;

uint256 a2zFee = div(3, 100);

enum Status{initial, lent, paid, destroyed}
Status status;
Status constant defaultStatus = Status.initial;

struct Request{
    Status status;
    uint256 requestedAmount;
    uint256 collvalue;
    uint256 duration;
    uint256 dueTime;

    address borrower;
    address lender;

    address requestedToken;
    address collToken;

    uint256 interestRate;
    uint256 expirationRequest;
}

//Loan[] private loans;
mapping(uint256 => Request) public requests;

function createRequest(
    address _borrower,
    uint256 _requestedAmount,
    address _requestedToken,
    address  _collToken,
    uint256 _duratiom,
    uint256 _expirationRequest,
    uint256 _interestRate,
    uint256 _collValue,
    uint256 _duration
) public returns (uint256){
    require(_borrower = msg.sender & _borrower != address(0));
    require(_requestedAmount != 0);
    require(_interestRate != 0);
    require(_expirationRequest > block.timestamp);
    require(balanceOf[msg.sender][_collValue] >= _collValue);

    Request memory request = requests[id];
    request.status = Status.initial;
    request.requestedAmount = _requestedAmount;
    request.borrower = msg.sender;
    request.lender = address(0);
    request.requestedToken = _requestedToken;
    request.collToken = _collToken;
    request.duration = _duration;
    request.expirationRequest = _expirationRequest;
    request.interestRate = _interestRate;
    request.collvalue = _collValue;
      
      requests.push(id);
     uint256 id = request.length -1;

     IERC20.transferFrom(msg.sender, address(this), _collValue);

     //emit Requestcreated(id, msg.sender);

     return id;

}


function fillRequest(uint256 id) public returns(bool) {
     Request storage request = requests[id];

     require(request.status = Status.initial);
     require(request.expirationRequest >= block.timestamp);
     require(balanceOf[msg.sender][requested.requestedToken] >= requestedAmount);

     request.lender = msg.sender;
     request.dueTime = uint40(block.timestamp) + request.duration;
     request.status = Status.lent;

     activeloans += 1;
     lendersBalance[request.lender] += 1;
     

     uint256 feeLast = fee(_interest, _a2zfee);
     
     IERC20.transferFrom(msg.sender, address(this), feeLast);

     uint256 lastAmount = resortAmount(_interset, _amount);

     IERC20.transferFrom(msg.sender, request.borrower, lastAmount);

     emit requestedFilled(id, msg.sender);

     return true;
}


 
function payLoan(uint256 id, uint256 _amount, address _from) public returns (bool){
    Request storage request = requests[id];

    require(request.status == Status.lent);
    require(balanceOf[msg.sender][request.requestedToken] >= _amount);

    uint256 _amount = request.requestedAmount;
    address _from = request.borrower;

    request.status = Status.paid;

    activeLoans -= 1;
    lendersBalance[request.lender] -=1;
     
     IERC20.transfer(request.collvalue(id), request.borrower(id));
     IERC20.transferFrom(msg.sender, address(this), request.requestedAmount(id));

     return true;
}    


function  fee(uint256 _interest, uint256 _a2zfee) internal returns (uint256) {

    uint256 _interest = request.interestRate;
    uint256 _ a2zfee = a2zfee;

    uint256 fee =  mul(_interest, _a2zfee);

    return fee;
}


function resortAmount(uint256 _interest, uint256 _amount) internal returns(uint256){
    uint256 _interest = request.interestRate;
    uint256 _amount = request.requestedAmount;

    uint256 amount = sub(_amount, _interest);

    return amount;

}

function liquidate(uint256 id)











    
}