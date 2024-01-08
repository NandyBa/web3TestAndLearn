// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

import 'forge-std/Test.sol';
import {AaveV3Ethereum} from 'aave-address-book/AaveV3Ethereum.sol';
import {IPoolAddressesProvider, IPool } from 'aave-address-book/AaveV3.sol';

contract AaveAddressBookTest is Test {
  IPoolAddressesProvider public POOL_ADDRESSES_PROVIDER;

  function setUp() public {
    vm.createSelectFork(vm.envString("MAINNET_RPC_URL"));
  }

  function testGetPool() public {
    POOL_ADDRESSES_PROVIDER = IPoolAddressesProvider(0x2f39d218133AFaB8F2B819B1066c7E434Ad94E9e);

    address poolAddress = POOL_ADDRESSES_PROVIDER.getPool();

    console.log('Pool', poolAddress);
    assertEq(poolAddress, address(AaveV3Ethereum.POOL));
  }
}
