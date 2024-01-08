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

  // function testPoolAddressProviderIsCorrect() public {
  //   assertEq(
  //     address(AaveV3Ethereum.POOL_ADDRESSES_PROVIDER),
  //     address(0xB53C1a33016B2DC2fF3653530bfF1848a515c8c5)
  //   );
  // }

  // function testPoolAddressIsCorrect() public {
  //   assertEq(address(AaveV3Ethereum.POOL), address(0x7d2768dE32b0b80b7a3454c06BdAc94A69DDc7A9));
  // }

  // function testPoolConfiguratorIsCorrect() public {
  //   assertEq(
  //     address(AaveV3Ethereum.POOL_CONFIGURATOR),
  //     address(0x311Bb771e4F8952E6Da169b425E7e92d6Ac45756)
  //   );
  // }

  // function testOracleIsCorrect() public {
  //   assertEq(address(AaveV3Ethereum.ORACLE), address(0xA50ba011c48153De246E5192C8f9258A2ba79Ca9));
  // }

  // function testAaveProtocolDataProviderIsCorrect() public {
  //   assertEq(
  //     address(AaveV3Ethereum.AAVE_PROTOCOL_DATA_PROVIDER),
  //     address(0x057835Ad21a177dbdd3090bB1CAE03EaCF78Fc6d)
  //   );
  // }

  // function testCollectorIsCorrect() public {
  //   assertEq(
  //     address(AaveV3Ethereum.COLLECTOR),
  //     address(0x464C71f6c2F760DdA6093dCB91C24c39e5d6e18c)
  //   );
  // }

  function testGetPool() public {
    POOL_ADDRESSES_PROVIDER = IPoolAddressesProvider(0x2f39d218133AFaB8F2B819B1066c7E434Ad94E9e);

    address poolAddress = POOL_ADDRESSES_PROVIDER.getPool();

    console.log('Pool', poolAddress);
    assertEq(poolAddress, address(AaveV3Ethereum.POOL));
  }
}
