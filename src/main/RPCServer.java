package main;

import org.apache.thrift.server.TServer;
import org.apache.thrift.server.TServer.Args;
import org.apache.thrift.server.TSimpleServer;
import org.apache.thrift.transport.TServerSocket;
import org.apache.thrift.transport.TServerTransport;
import org.apache.thrift.transport.TTransportException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import handler.ServiceHandler;
import server.Service;


public class RPCServer {
	final static Logger logger = LoggerFactory.getLogger(RPCServer.class);
	public static ServiceHandler handler = new ServiceHandler();
	public static Service.Processor<ServiceHandler> processor = new Service.Processor<ServiceHandler>(handler);
	
	public static void main(String[] args) {
		Runnable simple = new Runnable() {
	        public void run() {
	          simple(processor);
	        }
	      };      
	     
	      new Thread(simple).start();
	}

	public static void simple(Service.Processor<ServiceHandler> processor) {
	    TServerTransport serverTransport;
		try {
			serverTransport = new TServerSocket(9090);
			TServer server = new TSimpleServer(new Args(serverTransport).processor(processor));
			
			logger.info("Iniciando el servidor...");
			server.serve();
		} catch (TTransportException e) {
			e.printStackTrace();
		}
	  }
	
}
